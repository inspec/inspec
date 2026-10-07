# This file is not required by default.

require "rubygems/dependency_installer" unless defined?(Gem::DependencyInstaller)
require "rubygems/remote_fetcher" unless defined?(Gem::RemoteFetcher)

module Inspec::Plugin::V2
  # Installs train transport gems (for example `train-aws-premium` or `train-aws`) on demand,
  # in-process, so a subsequent `require` (performed by train's `Train.load_transport`) succeeds
  # without restarting the InSpec process.
  #
  # This is distinct from Inspec::Plugin::V2::Installer, which manages InSpec's own plugin gem set
  # in a dedicated plugin gem path. Train transport gems are installed into the default RubyGems
  # environment, which is where train's plain `require gem_name` calls expect to find them.
  class TrainPluginInstaller
    Gem.configuration["verbose"] = false

    # Installs the named gem (latest version from the configured gem sources) and activates its
    # spec(s) so the gem is immediately requireable in this process.
    #
    # @param [String] gem_name name of the gem to install, e.g. "train-aws-premium"
    # @return [Boolean] true if the gem was installed and activated successfully, false otherwise
    def install_and_activate(gem_name)
      Inspec::Log.debug "Attempting to auto-install train plugin gem '#{gem_name}'"

      specs = Gem::DependencyInstaller.new.install(gem_name)
      specs.each do |spec|
        spec.activate unless spec.activated?
      end

      Inspec::Log.debug "Successfully installed and activated train plugin gem '#{gem_name}'"
      true
    rescue Gem::GemNotFoundException, Gem::InstallError, Gem::DependencyError,
           Gem::Requirement::BadRequirementError, Gem::RemoteFetcher::FetchError => e
      Inspec::Log.debug "Failed to auto-install train plugin gem '#{gem_name}': #{e.message}"
      false
    end
  end
end
