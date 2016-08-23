# encoding: utf-8
# author: Steven Danna <steve@chef.io>
require 'inspec/log'
require 'inspec/errors'

module Inspec
  #
  # Inspec::Resolver is a simple dependency resolver. Unlike Bundler
  # or Berkshelf, it does not attempt to resolve each named dependency
  # to a single version. Rather, it traverses down the dependency tree
  # and:
  #
  # - Fetches the dependency from the source
  # - Checks the presence of cycles, and
  # - Checks that the specified dependency source satisfies the
  #   specified version constraint
  #
  # The full dependency tree is then available for the loader, which
  # will provide the isolation necessary to support multiple versions
  # of the same profile being used at runtime.
  #
  # Currently the fetching happens somewhat lazily depending on the
  # implementation of the fetcher being used.
  #
  class Resolver
    def self.resolve(dependencies, vendor_index, working_dir)
      reqs = dependencies.map do |dep|
        req = Inspec::Requirement.from_metadata(dep, vendor_index, cwd: working_dir)
        req || fail("Cannot initialize dependency: #{req}")
      end
      new(vendor_index).resolve(reqs)
    end

    def initialize(vendor_index)
      @vendor_index = vendor_index
    end

    def resolve(deps, top_level = true, seen_items = {}, path_string = '')
      graph = {}
      if top_level
        Inspec::Log.debug("Starting traversal of dependencies #{deps.map(&:name)}")
      else
        Inspec::Log.debug("Traversing dependency tree of transitive dependency #{deps.map(&:name)}")
      end

      deps.each do |dep|
        path_string = if path_string.empty?
                        dep.name
                      else
                        path_string + " -> #{dep.name}"
                      end

        if seen_items.key?(dep.source_url)
          fail Inspec::CyclicDependencyError, "Dependency #{dep} would cause a dependency cycle (#{path_string})"
        else
          seen_items[dep.source_url] = true
        end

        if !dep.source_satisfies_spec?
          fail Inspec::UnsatisfiedVersionSpecification, "The profile #{dep.name} from #{dep.source_url} has a version #{dep.source_version} which doesn't match #{dep.required_version}"
        end

        Inspec::Log.debug("Adding #{dep.source_url}")
        graph[dep.name] = dep
        if !dep.dependencies.empty?
          # Recursively resolve any transitive dependencies.
          resolve(dep.dependencies, false, seen_items.dup, path_string)
        end
      end

      Inspec::Log.debug('Dependency traversal complete.') if top_level
      graph
    end
  end
end
