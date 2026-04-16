# frozen_string_literal: true

module Inspec
  module Plugin
    module V2
      # holds all GemSpec related helper functions
      module GemSpecHelper

        def loaded_recent_most_version_of?(gemspec)
          # Check if the gem is already loaded via bundler
          # In most cases this is true since all Plugins/Resource Packs inherit from inspec-core
          gem_name = gemspec.name
          loaded_gem = Gem.loaded_specs[gem_name]
          return false unless loaded_gem

          # follow bundler's original philosophy i.e load gems that are recent most
          # This logic works unless there is a pinned version which we don't expect to have since these are managed by us
          if gemspec.version > loaded_gem.version
            # deactivate the lower version specs that are loaded via bundler
            Gem.loaded_specs.delete(gem_name)
            false # so it can re-activate the requested spec
          else
            # don't activate requested gemspec when the already loaded gem is the most recent version
            true
          end
        end
      end
    end
  end
end
