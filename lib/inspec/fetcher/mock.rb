require "inspec/fetcher"

module Inspec::Fetcher
  class Mock < Inspec.fetcher(1)
    name "mock"
    priority 0

    def self.resolve(target)
      if (target.is_a? Hash) && ((target.keys & %i{cwd path backend}).empty?)
        new(target)
      else
        nil
      end
    end

    def initialize(data)
      @data = data
    end

    def fetch(_path)
      archive_path
    end

    def archive_path
      { mock: @data }
    end

    def resolved_source
      { mock_fetcher: true }
    end

    def cache_key
      ""
    end
  end
end
