require 'inspec/plugin/v1'

module Inspec
  class FetcherRegistry < PluginRegistry
    def resolve(target)
      if fetcher_specified?(target)
        super(target)
      else
        Inspec::Log.debug("Assuming default supermarket source for #{target}")
        super(with_default_fetcher(target))
      end
    end

    NON_FETCHER_KEYS = [:name, :version_constraint, :cwd, :backend, :cache, :sha256].freeze
    def fetcher_specified?(target)
      # Only set a default for Hash-based (i.e. from
      # inspec.yml/inspec.lock) targets

      return true if !target.respond_to?(:keys)
      !(target.keys - NON_FETCHER_KEYS).empty?
    end

    def with_default_fetcher(target)
      target.merge({ supermarket: target[:name] })
    end
  end

  Fetcher = FetcherRegistry.new

  def self.fetcher(version)
    if version != 1
      raise 'Only fetcher version 1 is supported!'
    end
    Inspec::Plugins::Fetcher
  end
end

require 'fetchers/local'
require 'fetchers/url'
require 'fetchers/git'

# TODO: Remove in 4.0 when Compliance fetcher plugin is created
require 'plugins/inspec-compliance/lib/inspec-compliance/api'
