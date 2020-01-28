require_relative "utils/install_context"

module Inspec

  extend Inspec::InstallContextHelpers

  def self.config_dir
    ENV["INSPEC_CONFIG_DIR"] ? ENV["INSPEC_CONFIG_DIR"] : File.join(Dir.home, ".inspec")
  end

  def self.src_root
    @src_root ||= File.expand_path(File.join(__FILE__, "../../.."))
  end

end
