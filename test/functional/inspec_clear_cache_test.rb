require "functional/helper"
require "securerandom"

describe "inspec check" do
  include FunctionalHelper

  parallelize_me!

  describe "inspec clear_cache" do
    it "clears any existing cache" do
      dirname = File.expand_path("~/.inspec/#{SecureRandom.hex(10)}/alt-cache")
      unless File.directory?(dirname)
        FileUtils.mkdir_p(dirname)
      end
      newfile = "#{dirname}/#{SecureRandom.hex(10)}.txt"
      File.write(newfile, SecureRandom.hex(100))

      assert !Dir.glob(newfile).empty?

      out = inspec("clear_cache --vendor-cache=#{dirname}")

      assert_empty Dir.glob(newfile)
      assert_exit_code 0, out
      _(out.stdout).must_include "== InSpec cache cleared successfully ==\n"
    end
  end
end
