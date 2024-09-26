require "inspec/plugin/v1"

module Inspec
  class FetcherRegistry < PluginRegistry
    def resolve(target, opts = {})
      if fetcher_specified?(target)
        super(target, opts)
      else
        Inspec::Log.debug("Assuming default supermarket source for #{target}")
        super(with_default_fetcher(target), opts)
      end
    end

    NON_FETCHER_KEYS = %i{name version_constraint cwd backend cache sha256}.freeze
    def fetcher_specified?(target)
      # Only set a default for Hash-based (i.e. from
      # inspec.yml/inspec.lock) targets

      return true unless target.respond_to?(:keys)

      !(target.keys - NON_FETCHER_KEYS).empty?
    end

    def with_default_fetcher(target)
      target.merge({ supermarket: target[:name] })
    end
  end

  module Fetcher
    Registry = FetcherRegistry.new
  end

  def self.fetcher(version)
    if version != 1
      raise "Only fetcher version 1 is supported!"
    end

    Inspec::Plugins::Fetcher
  end
end

# TODO: remove. require up, not down.
require "inspec/fetcher/local"
require "inspec/fetcher/url"
require "inspec/fetcher/git"
require "inspec/fetcher/gem"
require "plugins/inspec-compliance/lib/inspec-compliance/api"
