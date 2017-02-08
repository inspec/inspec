# encoding: utf-8
require 'inspec/cached_fetcher'
require 'inspec/dependencies/dependency_set'
require 'digest'

module Inspec
  #
  # Inspec::Requirement represents a given profile dependency, where
  # appropriate we delegate to Inspec::Profile directly.
  #
  class Requirement
    def self.from_metadata(dep, cache, opts)
      raise 'Cannot load empty dependency.' if dep.nil? || dep.empty?
      new(dep[:name], dep[:version], cache, opts[:cwd], opts.merge(dep))
    end

    def self.from_lock_entry(entry, cwd, cache, backend, opts = {})
      req = new(entry[:name],
                entry[:version_constraints],
                cache,
                cwd,
                entry[:resolved_source].merge(backend: backend).merge(opts))

      locked_deps = []
      Array(entry[:dependencies]).each do |dep_entry|
        locked_deps << Inspec::Requirement.from_lock_entry(dep_entry, cwd, cache, backend, opts)
      end
      req.lock_deps(locked_deps)
      req
    end

    attr_reader :cwd, :opts, :required_version
    def initialize(name, version_constraints, cache, cwd, opts)
      @name = name
      @required_version = Gem::Requirement.new(Array(version_constraints))
      @cache = cache
      @backend = opts[:backend]
      @opts = opts
      @cwd = cwd
    end

    #
    # A dependency can be renamed in inspec.yml/inspec.lock.  Prefer
    # the name the user gave this dependency over the profile name.
    #
    def name
      @name || profile.name
    end

    def source_version
      profile.version
    end

    def source_satisfies_spec?
      gem_dep.match?(profile.name, profile.version)
    end

    def gem_dep
      @gem_dep ||= Gem::Dependency.new(profile.name, required_version, :runtime)
    end

    def resolved_source
      @resolved_source ||= fetcher.resolved_source
    end

    def to_hash
      h = {
        'name' => name,
        'resolved_source' => resolved_source,
        'version_constraints' => required_version.to_s,
      }

      if !dependencies.empty?
        h['dependencies'] = dependencies.map(&:to_hash)
      end

      h
    end

    def lock_deps(dep_array)
      @dependencies = dep_array
    end

    def fetcher
      @fetcher ||= Inspec::CachedFetcher.new(opts, @cache)
    end

    # load dependencies of the dependency
    def dependencies
      @dependencies ||= profile.metadata.dependencies.map do |r|
        Inspec::Requirement.from_metadata(r, @cache, cwd: @cwd, backend: @backend)
      end
    end

    def to_s
      name
    end

    # load the profile for the requirement
    def profile
      return @profile if ! @profile.nil?
      opts = @opts.dup
      opts[:backend] = @backend
      if !@dependencies.nil?
        opts[:dependencies] = Inspec::DependencySet.from_array(@dependencies, @cwd, @cache, @backend)
      end
      @profile = Inspec::Profile.for_fetcher(fetcher, opts)
    end
  end
end
