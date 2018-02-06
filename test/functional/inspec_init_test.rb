require 'functional/helper'
require 'fileutils'
require 'tmpdir'
require 'yaml'

describe 'inspec init' do
  include FunctionalHelper

  tmpdir = Dir.tmpdir

  describe 'inspec init profile with/slash' do
    it 'names profile with string after last slash' do
      slash_profile = "#{tmpdir}/inspecwith/slash"
      out = inspec("init profile #{slash_profile}")
      out.exit_status.must_equal 0
      File.exist?(slash_profile).must_equal true
      profile = YAML.load_file("#{slash_profile}/inspec.yml")
      profile['name'].must_equal 'slash'
    end
  end

  Dir.glob("#{tmpdir}/inspecwith*").each {|i| FileUtils.remove_entry_secure(i) }
end
