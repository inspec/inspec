# This file is not required by default.

require "inspec/plugin/v2/installer"
require "inspec/plugin/v2/loader"

module Inspec::Plugin::V2
  # Installs train transport gems (for example `train-aws-premium` or `train-aws`) on demand,
  # in-process, so a subsequent `require` (performed by train's `Train.load_transport`) succeeds
  # without restarting the InSpec process.
  #
  # Installation follows the same path as resource pack gems: Inspec::Plugin::V2::Installer, which
  # registers the license-keyed private Chef rubygems server (where premium gems are hosted) and
  # installs into the InSpec plugin gem path. The gem is then activated through the plugin Loader.
  class TrainPluginInstaller
    # Installs the named gem (latest version from the configured and private gem sources) and
    # activates it so the gem is immediately requireable in this process.
    #
    # @param [String] gem_name name of the gem to install, e.g. "train-aws-premium"
    # @return [Boolean] true if the gem was installed and activated successfully, false otherwise
    def install_and_activate(gem_name)
      Inspec::Log.debug "Attempting to auto-install train plugin gem '#{gem_name}'"

      Inspec::Plugin::V2::Installer.instance.ensure_installed(gem_name)
      Inspec::Plugin::V2::Loader.new.activate_managed_gems_for_plugin(gem_name)

      Inspec::Log.debug "Successfully installed and activated train plugin gem '#{gem_name}'"
      true
    rescue Inspec::Plugin::V2::GemActionError, Inspec::Plugin::V2::LoadError, Gem::LoadError, Gem::GemNotFoundException, Gem::InstallError,
           Gem::DependencyError, Gem::Requirement::BadRequirementError,
           Gem::RemoteFetcher::FetchError => e
      Inspec::Log.debug "Failed to auto-install train plugin gem '#{gem_name}' " \
        "(private Chef gem source requires a valid license): #{e.message}"
      false
    end
  end
end
