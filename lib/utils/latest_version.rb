# encoding: utf-8
# author: Christoph Hartmann

require 'json'
require 'net/http'

class LatestInSpecVersion
  # fetches the latest version from rubygems server
  def latest
    uri = URI('https://rubygems.org/api/v1/gems/inspec.json')
    res = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https',
                          open_timeout: 0.5, read_timeout: 0.5
                         ) {|http|
      http.get(uri.path)
    }
    inspec_info = JSON.parse(res.body)
    inspec_info['version']
  rescue Exception # rubocop:disable Lint/RescueException
    nil
  end
end
