# encoding: utf-8
require 'inspec/cached_fetcher'
require 'inspec/dependencies/dependency_set'
require 'semverse'

module Inspec
  #
  # Inspec::Requirement represents a given profile dependency, where
  # appropriate we delegate to Inspec::Profile directly.
  #
  class Requirement
    def self.from_metadata(dep, cache, opts)
      raise 'Cannot load empty dependency.' if dep.nil? || dep.empty?

      req_path = opts[:cwd]

      if dep[:path]
        req_path = File.expand_path(dep[:path], req_path)
      end

      new(dep[:name],
          dep[:version],
          cache,
          req_path,
          opts.merge(dep))
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

    attr_reader :cwd, :opts, :version_constraints
    def initialize(name, version_constraints, cache, cwd, opts)
      @name = name
      @version_constraints = Array(version_constraints)
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
      return true if version_constraints.empty?

      # Semverse::Constraint.satisfy_all returns a list of versions that match all of the
      # supplied constraints. Since we're only matching against a single version, the return
      # of satisfy_all will be non-empty if the profile version we have satisfies the constraints.
      constraints = @version_constraints.map { |x| Semverse::Constraint.new(x) }
      !Semverse::Constraint.satisfy_all(constraints, Semverse::Version.new(profile.version)).empty?
    end

    def resolved_source
      @resolved_source ||= fetcher.resolved_source
    end

    def to_hash
      h = {
        'name' => name,
        'resolved_source' => resolved_source,
        'version_constraints' => Gem::Requirement.new(version_constraints).to_s,
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
      return @profile unless @profile.nil?
      opts = @opts.dup
      opts[:backend] = @backend
      if !@dependencies.nil?
        opts[:dependencies] = Inspec::DependencySet.from_array(@dependencies, @cwd, @cache, @backend)
      end
      @profile = Inspec::Profile.for_fetcher(fetcher, opts)
    end
  end
end
