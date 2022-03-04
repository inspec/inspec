# This class will install the gem depedencies for profiles etc.
# The basic things which is required to install dependencies is the gem path where gem needs to be installed
# and the list of gems needs to be installed.
require "rubygems/remote_fetcher"
require "forwardable" unless defined?(Forwardable)

module Inspec
  class DependencyInstaller
    extend Forwardable

    attr_reader :gem_path, :requested_gems, :dependency_loader

    def_delegator :dependency_loader, :inspec_gem_path

    def initialize(gem_path = nil, requested_gems = [])
      @dependency_loader = Inspec::DependencyLoader.new
      @gem_path = gem_path || inspec_gem_path
      @requested_gems = requested_gems
    end

    def install
      requested_gems.each do |requested_gem|
        version = requested_gem[:version].nil? ? "> 0" : requested_gem[:version]
        install_from_remote_gems(requested_gem[:name], { version: version })
      end
    end

    private

    def install_from_remote_gems(requested_gem_name, opts)
      version = opts[:version].split(",")
      begin
        gem_dependency = Gem::Dependency.new(requested_gem_name, version || "> 0")

        # BestSet is rubygems.org API + indexing, APISet is for custom sources
        sources = if opts[:source]
                    Gem::Resolver::APISet.new(URI.join(opts[:source] + "/api/v1/dependencies"))
                  else
                    Gem::Resolver::BestSet.new
                  end

        install_gem_to_gems_dir(gem_dependency, [sources], opts[:update_mode])
      rescue Gem::RemoteFetcher::FetchError => gem_ex
        ex = Inspec::GemDependencyInstallError.new(gem_ex.message)
        ex.gem_name = requested_gem_name
        raise ex
      rescue Gem::Requirement::BadRequirementError => gem_ex
        ex = Inspec::GemDependencyInstallError.new(gem_ex.message)
        ex.gem_name = requested_gem_name
        raise "Unparseable gem dependency '#{version}' for '#{ex.gem_name}'"
      end
    end

    def install_gem_to_gems_dir(gem_dependency, extra_request_sets = [], update_mode = false)
      # Solve the dependency (that is, find a way to install the new gem and anything it needs)
      request_set = Gem::RequestSet.new(gem_dependency)

      begin
        solution = request_set.resolve
      rescue Gem::UnsatisfiableDependencyError => gem_ex
        ex = Inspec::GemDependencyInstallError.new(gem_ex.message)
        ex.gem_name = gem_dependency.name
        raise ex
      end

      # OK, perform the installation.
      # Ignore deps here, because any needed deps should already be baked into gem_dependency
      request_set.install_into(gem_path, true, ignore_dependencies: true, document: [])

      # Locate the GemVersion for the new dependency and return it
      solution.detect { |g| g.name == gem_dependency.name }.version
    end
  end
end
