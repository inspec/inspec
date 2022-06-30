require "json" unless defined?(JSON)

module Inspec::Reporters
  # rubocop:disable Layout/AlignHash, Style/BlockDelimiters
  class Json < Base
    def render
      output(report.to_json, false)
    end

    def report
      output = {
        platform: platform,
        profiles: profiles,
        statistics: {
          duration: run_data[:statistics][:duration],
        },
        version: run_data[:version],
      }

      %w{passthrough}.each do |option|
        output[option.to_sym] = @config[option] unless @config[option].nil?
      end
      output
    end

    private

    def platform
      {
        name:      run_data[:platform][:name],
        release:   run_data[:platform][:release],
        target_id: run_data[:platform][:target_id] || "",
      }.reject { |_k, v| v.nil? }
    end

    def profile_results(control)
      (control[:results] || []).map { |r|
        {
          status:          r[:status],
          code_desc:       r[:code_desc],
          run_time:        r[:run_time],
          start_time:      r[:start_time],
          resource:        r[:resource],
          skip_message:    r[:skip_message],
          message:         r[:message],
          exception:       r[:exception],
          backtrace:       r[:backtrace],
          resource_class:  r[:resource_class],
          resource_params: r[:resource_params].to_s,
          resource_id:     extract_resource_id(r),
        }.reject { |_k, v| v.nil? }
      }
    end

    def extract_resource_id(r)
      # According to the RunData API, this is supposed to be an anonymous
      # class that represents a resource, with embedded instance methods....
      resource_obj = r[:resource_title]
      return resource_obj.resource_id if resource_obj.respond_to?(:resource_id)

      # But sometimes, it isn't, and has been collapsed into the to_s stringification of the resource.
      if resource_obj.is_a?(String)
        orig_str = resource_obj
        # Try to trim off the resource class - eg "File /some/path" => "/some/path"
        trimmed_str = orig_str.sub(/^#{r[:resource_class]}/i, "").strip
        trimmed_str.empty? ? orig_str : trimmed_str
      else
        # Boo, InSpec is crazy, and we don't know what it possibly could be.
        # Failsafe for resource_id is empty string.
        ""
      end
    end

    def profiles
      run_data[:profiles].map do |p|
        res = {
          name:            p[:name],
          version:         p[:version],
          sha256:          p[:sha256],
          title:           p[:title],
          maintainer:      p[:maintainer],
          summary:         p[:summary],
          license:         p[:license],
          copyright:       p[:copyright],
          copyright_email: p[:copyright_email],
          supports:        p[:supports],
          # TODO: rename exposed field to inputs, see #3802:
          attributes:      (p[:inputs] || p[:attributes]),
          parent_profile:  p[:parent_profile],
          depends:         p[:depends],
          groups:          profile_groups(p),
          controls:        profile_controls(p),
          status:          p[:status],
          status_message:  p[:status_message],
          waiver_data:     p[:waiver_data],
        }.reject { |_k, v| v.nil? }

        # For backwards compatibility
        res[:skip_message] = res[:status_message] if res[:status] == "skipped"

        res
      end
    end

    def profile_groups(profile)
      (profile[:groups] || []).map { |g|
        {
          id: g[:id],
          controls: g[:controls],
          title: g[:title],
        }.reject { |_k, v| v.nil? }
      }
    end

    def profile_controls(profile)
      (profile[:controls] || []).map { |c|
        control_hash = {
          id:     c[:id],
          title:  c[:title],
          desc:   c.dig(:descriptions, :default),
          descriptions: convert_descriptions(c[:descriptions]),
          impact: c[:impact],
          refs:   c[:refs],
          tags:   c[:tags],
          code:   c[:code],
          source_location: {
            line: c[:source_location][:line],
            ref:  c[:source_location][:ref],
          },
          waiver_data: c[:waiver_data] || {},
          results: profile_results(c),
        }
        control_hash.merge!({ status: c[:status] }) if enhanced_outcomes
        control_hash
      }
    end

    def convert_descriptions(data)
      (data || []).map { |label, text|
        {
          label: label.to_s,
          data:  text,
        }
      }
    end
  end
end
