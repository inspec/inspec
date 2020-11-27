require_relative "utils/install_context"

require 'etc' unless defined?(Etc)

module Inspec

  extend Inspec::InstallContextHelpers
  
  def self.config_dir
    begin
  	  home = Dir.home
  	rescue ArgumentError, NoMethodError
  	  # $HOME is not set in systemd service File.expand_path('~') will not work here
  	  home = Etc.getpwuid(Process.uid).dir
  	end

    ENV["INSPEC_CONFIG_DIR"] ? ENV["INSPEC_CONFIG_DIR"] : File.join(home, ".inspec")
  end

  def self.src_root
    @src_root ||= File.expand_path(File.join(__FILE__, "../../.."))
  end

end
