require "json"

module Inspec::Reporters
  # rubocop:disable Layout/AlignHash, Style/BlockDelimiters
  class Json < Base
    def render
      output(report.to_json, false)
    end

    def report
      {
        platform: platform,
        profiles: profiles,
        statistics: {
          duration: run_data[:statistics][:duration],
        },
        version: run_data[:version],
      }
    end

    private

    def platform
      {
        name:      run_data[:platform][:name],
        release:   run_data[:platform][:release],
        target_id: @config["target_id"],
      }.reject { |_k, v| v.nil? }
    end

    def profile_results(control)
      (control[:results] || []).map { |r|
        {
          status:       r[:status],
          code_desc:    r[:code_desc],
          run_time:     r[:run_time],
          start_time:   r[:start_time],
          resource:     r[:resource],
          skip_message: r[:skip_message],
          message:      r[:message],
          exception:    r[:exception],
          backtrace:    r[:backtrace],
          waiver_data:  r[:waiver_data],
        }.reject { |_k, v| v.nil? }
      }
    end

    def profiles
      run_data[:profiles].map { |p|
        {
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
          skip_message:    p[:skip_message],
          waiver_data:     p[:waiver_data],
        }.reject { |_k, v| v.nil? }
      }
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
        {
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
          results: profile_results(c),
        }
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
