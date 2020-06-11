require "libyajl2/version"

module Libyajl2
  VENDORED_LIBYAJL2_DIR = File.expand_path("../libyajl2/vendored-libyajl2", __FILE__)

  def self.opt_path
    File.join(VENDORED_LIBYAJL2_DIR, "lib")
  end

  def self.include_path
    File.join(VENDORED_LIBYAJL2_DIR, "include")
  end
end
