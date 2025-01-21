# frozen_string_literal: true
require "singleton" unless defined?(Singleton)
require 'forwardable' unless defined?(Forwardable)
require "chef-licensing"

module Inspec::Plugin::V2
  class GemSourceManager
    include Singleton
    extend Forwardable

    DEFAULT_CHEF_RUBY_GEMS_SERVER = "rubygems.chef.io"
    DEFAULT_USERNAME = "v1"

    def add_chef_rubygems_server
      register_source(chef_rubygems_server)
    end

    def add(sources)
      Array(sources).each { |source| register_source(source) }
    end

    private

    def chef_rubygems_server
      "https://#{DEFAULT_USERNAME}:#{licenses_string}@#{DEFAULT_CHEF_RUBY_GEMS_SERVER}"
    end

    def register_source(source)
      sources = Gem.sources.sources
      gem_source = Gem::Source.new(source)
      sources << gem_source unless sources.include?(gem_source)
    end

    def licenses_string
      ChefLicensing.license_keys.join(',')
    end
  end
end