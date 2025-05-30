# frozen_string_literal: true
require "singleton" unless defined?(Singleton)
require "forwardable" unless defined?(Forwardable)
# require "chef-licensing" ## Disabled licensing - undo this change once ChefLicensing is enabled

module Inspec::Plugin::V2
  class GemSourceManager
    include Singleton
    extend Forwardable

    DEFAULT_CHEF_RUBY_GEMS_SERVER = "rubygems.chef.io"
    DEFAULT_USERNAME = "v1"

    def initialize
      @sources = Gem.sources
    end

    def_delegator :@sources, :sources

    ## Disabled licensing - undo this change once ChefLicensing is enabled
    # def add_chef_rubygems_server
    #   register_source(chef_rubygems_server)
    # end

    def add(sources)
      Array(sources).each { |source| register_source(source) }
    end

    private

    ## Disabled licensing - undo this change once ChefLicensing is enabled
    # def chef_rubygems_server
    #   "https://#{DEFAULT_USERNAME}:#{licenses_string}@#{DEFAULT_CHEF_RUBY_GEMS_SERVER}"
    # end

    def register_source(source)
      gem_source = Gem::Source.new(source)
      sources << gem_source unless sources.include?(gem_source)
    end

    ## Disabled licensing - undo this change once ChefLicensing is enabled
    # def licenses_string
    #   ChefLicensing.license_keys.join(",")
    # end
  end
end