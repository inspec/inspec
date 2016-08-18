# encoding: utf-8
require 'inspec/fetcher'

module Inspec
  class Requirement
    attr_reader :name, :dep, :cwd, :opts

    def initialize(name, version_constraints, cwd, opts)
      @name = name
      @dep = Gem::Dependency.new(name,
                                 Gem::Requirement.new(Array(version_constraints)),
                                 :runtime)
      @fetcher = fetcher_for_options(opts)
      @opts = opts
      @cwd = cwd
    end

    def matches_spec?(spec)
      params = spec.profile.metadata.params
      @dep.match?(params[:name], params[:version])
    end

    def fetcher_for_options(opts)
      f = if opts[:path]
            Fetchers::Local.resolve(File.expand_path(opts[:path], @cwd))
          elsif opts[:url]
            Fetchers::Url.resolve(opts[:url])
          else
            fail "No known fetcher for dependency #{name} (options: #{opts})"
          end

      fail "Unable to resolve source for #{name} (options: #{opts})" if f.nil?
      f
    end

    def pull
      case
      when @opts[:path]
        File.expand_path(@opts[:path], @cwd)
      else
        fail 'You must specify the source of the dependency (for now...)'
      end
    end

    def path
      @path ||= pull
    end

    def profile
      return nil if path.nil?
      @profile ||= Inspec::Profile.for_target(path, {})
    end

    def self.from_metadata(dep, opts)
      fail 'Cannot load empty dependency.' if dep.nil? || dep.empty?
      name = dep[:name] || fail('You must provide a name for all dependencies')
      version = dep[:version]
      new(name, version, opts[:cwd], opts.merge(dep))
    end
  end
end
