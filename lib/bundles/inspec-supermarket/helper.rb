# encoding: utf-8
# author: Jeremy Miller

module Supermarket
  class Helper
    def self.parse_host(location)
      uri = URI(location)
      return nil if uri.scheme != 'supermarket' || uri.path =~ %r{/\A}
      case uri.path.count('/')
      when 0, 2, 4
        Supermarket::API.update_config('supermarket_url', "https://#{uri.host}")
      end
    rescue URI::Error => _e
      nil
    end
  end
end
