require 'json'

module Inspec::Reporters
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
      platform = {
        name: run_data[:platform][:name],
        release: run_data[:platform][:release],
      }
      platform[:target_id] = @config['target_id'] if @config['target_id']
      platform
    end

    def profile_results(control)
      results = []
      return results if control[:results].nil?

      control[:results].each do |r|
        result = {
          status: r[:status],
          code_desc: r[:code_desc],
          run_time: r[:run_time],
          start_time: r[:start_time],
        }
        result[:resource] = r[:resource] if r[:resource]
        result[:skip_message] = r[:skip_message] if r[:skip_message]
        result[:message] = r[:message] if r[:message]
        result[:exception] = r[:exception] if r[:exception]
        result[:backtrace] = r[:backtrace] if r[:backtrace]

        results << result
      end
      results
    end

    def profile_controls(profile)
      controls = []
      return controls if profile[:controls].nil?

      profile[:controls].each do |c|
        control = {
          id: c[:id],
          title: c[:title],
          desc: c.dig(:descriptions, :default),
          descriptions: convert_descriptions(c[:descriptions]),
          impact: c[:impact],
          refs: c[:refs],
          tags: c[:tags],
          code: c[:code],
          source_location: {
            line: c[:source_location][:line],
            ref: c[:source_location][:ref],
          },
          results: profile_results(c),
        }
        controls << control
      end
      controls
    end

    def profile_groups(profile)
      groups = []
      return groups if profile[:groups].nil?

      profile[:groups].each do |g|
        group = {
          id: g[:id],
          controls: g[:controls],
        }
        group[:title] = g[:title] if g[:title]

        groups << group
      end
      groups
    end

    def profiles
      profiles = []
      run_data[:profiles].each do |p|
        profile = {
          name: p[:name],
          version: p[:version],
          sha256: p[:sha256],
          title: p[:title],
          maintainer: p[:maintainer],
          summary: p[:summary],
          license: p[:license],
          copyright: p[:copyright],
          copyright_email: p[:copyright_email],
          supports: p[:supports],
          attributes: (p[:inputs] ? p[:inputs] : p[:attributes]), # TODO: rename exposed field to inputs, see #3802
          parent_profile: p[:parent_profile],
          depends: p[:depends],
          groups: profile_groups(p),
          controls: profile_controls(p),
          status: p[:status],
          skip_message: p[:skip_message],
        }
        profiles << profile.reject { |_k, v| v.nil? }
      end
      profiles
    end

    def convert_descriptions(data)
      return [] if data.nil?
      results = []
      data.each do |label, text|
        results.push({ label: label.to_s, data: text })
      end
      results
    end
  end
end
