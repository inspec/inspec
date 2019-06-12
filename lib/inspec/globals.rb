module Inspec
  def self.config_dir
    ENV["INSPEC_CONFIG_DIR"] ? ENV["INSPEC_CONFIG_DIR"] : File.join(Dir.home, ".inspec")
  end

  def self.src_root
    File.expand_path(File.join(__FILE__, "..", "..", ".."))
  end
end
