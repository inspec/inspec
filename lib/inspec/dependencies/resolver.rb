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
    def self.resolve(dependencies, cache, working_dir, backend)
      reqs = dependencies.map do |dep|
        req = Inspec::Requirement.from_metadata(dep, cache, cwd: working_dir, backend: backend)
        req || raise("Cannot initialize dependency: #{req}")
      end
      new.resolve(reqs)
    end

    def detect_duplicates(deps, top_level, path_string)
      seen_items_local = []
      deps.each do |dep|
        if seen_items_local.include?(dep.name)
          problem_cookbook = if top_level
                               'the inspec.yml for this profile.'
                             else
                               "the dependency information for #{path_string.split(' ').last}"
                             end
          raise Inspec::DuplicateDep, "The dependency #{dep.name} is listed twice in #{problem_cookbook}"
        else
          seen_items_local << dep.name
        end
      end
    end

    def resolve(deps, top_level = true, seen_items = {}, path_string = '') # rubocop:disable Metrics/AbcSize
      graph = {}
      if top_level
        Inspec::Log.debug("Starting traversal of dependencies #{deps.map(&:to_s)}")
      else
        Inspec::Log.debug("Traversing dependency tree of transitive dependency #{deps.map(&:name)}")
      end

      detect_duplicates(deps, top_level, path_string)
      deps.each do |dep|
        new_seen_items = seen_items.dup
        new_path_string = if path_string.empty?
                            dep.name
                          else
                            path_string + " -> #{dep.name}"
                          end

        if new_seen_items.key?(dep.resolved_source)
          raise Inspec::CyclicDependencyError, "Dependency #{dep} would cause a dependency cycle (#{new_path_string})"
        else
          new_seen_items[dep.resolved_source] = true
        end

        if !dep.source_satisfies_spec?
          raise Inspec::UnsatisfiedVersionSpecification, "The profile #{dep.name} from #{dep.resolved_source} has a version #{dep.source_version} which doesn't match #{dep.required_version}"
        end

        Inspec::Log.debug("Adding dependency #{dep.name} (#{dep.resolved_source})")
        graph[dep.name] = dep
        if !dep.dependencies.empty?
          resolve(dep.dependencies, false, new_seen_items.dup, new_path_string)
        end
      end

      Inspec::Log.debug('Dependency traversal complete.') if top_level
      graph
    end
  end
end
