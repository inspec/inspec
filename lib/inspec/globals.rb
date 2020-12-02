require_relative "utils/install_context"

module Inspec
  extend Inspec::InstallContextHelpers

  def self.config_dir
    ENV["INSPEC_CONFIG_DIR"] || File.join(home_path, ".inspec")
  end

  def self.src_root
    @src_root ||= File.expand_path(File.join(__FILE__, "../../.."))
  end

  def self.home_path
    Dir.home
  rescue ArgumentError, NoMethodError
    # $HOME is not set in systemd service File.expand_path('~') will not work here
    require "etc" unless defined?(Etc)
    Etc.getpwuid(Process.uid).dir
  end
end
