# encoding: utf-8
module Inspec
  class Requirement
    attr_reader :name, :dep, :cwd, :opts
    def initialize(name, version_constraints, cwd, opts)
      @name = name
      @dep = Gem::Dependency.new(name,
                                 Gem::Requirement.new(Array(version_constraints)),
                                 :runtime)
      @opts = opts
      @cwd = cwd
    end

    def matches_spec?(spec)
      params = spec.profile.metadata.params
      @dep.match?(params[:name], params[:version])
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
