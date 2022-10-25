# This class will load the gem depedencies for profiles etc.
# The basic things which is required to load gem dependencies is the path from which gems needs to be loaded
# and the list of gems needs to be loaded.

module Inspec
  class DependencyLoader
    attr_accessor :gem_path, :gem_list

    # initializes the dependency_loader
    def initialize(gem_path = nil, gem_list = [])
      @gem_path = gem_path || inspec_gem_path
      @gem_list = gem_list
    end

    def load
      Gem.path << gem_path
      Gem.refresh

      gem_list.each do |gem_data|
        version = gem_data[:version].nil? ? "> 0" : gem_data[:version]
        activate_gem_dependency(gem_data[:name], version)
      end
    end

    def inspec_gem_path
      self.class.inspec_gem_path
    end

    def self.inspec_gem_path
      require "rbconfig" unless defined?(RbConfig)
      ruby_abi_version = RbConfig::CONFIG["ruby_version"]
      # TODO: why are we installing under the api directory for plugins?
      base_dir = Inspec.config_dir
      base_dir = File.realpath base_dir if File.exist? base_dir
      File.join(base_dir, "gems", ruby_abi_version)
    end

    # Lists all gems found in the inspec_gem_path.
    # @return [Array[Gem::Specification]] Specs of all gems found.
    def list_managed_gems
      Dir.glob(File.join(gem_path, "specifications", "*.gemspec")).map { |p| Gem::Specification.load(p) }
    end

    def list_installed_gems
      list_managed_gems
    end

    def gem_installed?(name)
      list_installed_gems.any? { |spec| spec.name == name }
    end

    def gem_version_installed?(name, version)
      if version.nil?
        list_installed_gems.any? { |s| s.name == name }
      else
        list_installed_gems.any? { |s| s.name == name && Gem::Requirement.new(version.split(",")) =~ s.version }
      end
    end

    private

    def activate_gem_dependency(name, version_constraint = "> 0")
      version_constraint = version_constraint.split(",")
      gem_deps = [Gem::Dependency.new(name.to_s, version_constraint)]
      managed_gem_set = Gem::Resolver::VendorSet.new

      # Note: There is an issue in resolving gem dependency.
      # This block resolves that issue partially.
      # But this will still fail for the gems which don't have the .gemspec file.
      # TODO: Find the solution to resolve gem dependencies that work for the unpackaged gems which don't have the .gemspec file.
      list_managed_gems.each do |spec|
        unless Dir["#{spec.gem_dir}/*.gemspec"].empty?
          managed_gem_set.add_vendor_gem(spec.name, spec.gem_dir)
        end
      end

      # TODO: Next two lines merge our managed gems with the other gems available
      # in our "local universe" - which may be the system, or it could be in a Bundler microcosm,
      # or rbenv, etc. Do we want to merge that, though?
      distrib_gem_set = Gem::Resolver::CurrentSet.new
      installed_gem_set = Gem::Resolver.compose_sets(managed_gem_set, distrib_gem_set)

      # So, given what we need, and what we have available, what activations are needed?
      resolver = Gem::Resolver.new(gem_deps, installed_gem_set)

      begin
        solution = resolver.resolve
      rescue Gem::UnsatisfiableDependencyError => gem_ex
        # If you broke your install, or downgraded to a plugin with a bad gemspec, you could get here.
        ex = Inspec::GemDependencyLoadError.new(gem_ex.message)
        raise ex
      end
      solution.each do |activation_request|
        next if activation_request.full_spec.activated?

        activation_request.full_spec.activate
        # TODO: If we are under Bundler, inform it that we loaded a gem
      end
    end
  end
end
