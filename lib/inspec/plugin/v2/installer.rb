# This file is not required by default.

require 'singleton'

module Inspec::Plugin::V2
  class Installer
    include Singleton

    def gem_path
      Inspec::Plugin::V2::Loader.plugin_gem_path
    end

  end
end