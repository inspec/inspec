# encoding: utf-8

require 'json'
require 'net/http'

module Inspec::Reporters
  class Automate < Json
    def enriched_report
      # grab the report from the parent class
      final_report = report

      # Label this content as an inspec_report
      final_report[:type] = 'inspec_report'

      final_report[:end_time] = Time.now.utc.strftime('%FT%TZ')
      final_report[:node_uuid] = @config['node_uuid'] || @run_data[:platform][:uuid]
      final_report[:report_uuid] = uuid_from_string(final_report[:end_time] + final_report[:node_uuid])

      # optional json-config passthrough options
      %w{node_name environment roles recipies}.each do |option|
        final_report[option.to_sym] = @config[option] unless @config[option].nil?
      end
      final_report
    end

    def send_report
      headers = { 'Content-Type' => 'application/json' }
      headers['x-data-collector-token'] = @config['token']
      headers['x-data-collector-auth'] = 'version=1.0'

      uri = URI(@config['url'])
      req = Net::HTTP::Post.new(uri.path, headers)
      req.body = enriched_report.to_json
      begin
        Inspec::Log.debug "Posting report to Chef Automate: #{uri.path}"
        Net::HTTP.start(uri.hostname,
                        uri.port,
                        use_ssl: uri.scheme == 'https',
                        verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
          http.request(req)
        end
        return true
      rescue => e
        Inspec::Log.error "send_report: POST to #{uri.path} returned: #{e.message}"
        return false
      end
    end

    private

    # This hashes the passed string into SHA1.
    # Then it downgrades the 160bit SHA1 to a 128bit
    # then we format it as a valid UUIDv5.
    def uuid_from_string(string)
      hash = Digest::SHA1.new
      hash.update(string)
      ary = hash.digest.unpack('NnnnnN')
      ary[2] = (ary[2] & 0x0FFF) | (5 << 12)
      ary[3] = (ary[3] & 0x3FFF) | 0x8000
      # rubocop:disable Style/FormatString
      '%08x-%04x-%04x-%04x-%04x%08x' % ary
    end
  end
end
