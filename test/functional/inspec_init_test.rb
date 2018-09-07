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

  describe 'inspec init profile options' do
    it 'populates the inspec.yml' do
      options_profile = "#{tmpdir}/options"
      options = "--email='joe@chef.io' --maintainer='Chef' --title='This is a title' --summary='Someone wrote a summary' --version='0.5.1'"
      out = inspec("init profile #{options_profile} #{options}")
      out.exit_status.must_equal 0
      File.exist?(options_profile).must_equal true
      profile = YAML.load_file("#{options_profile}/inspec.yml")
      profile['name'].must_equal 'options'
      profile['title'].must_equal 'This is a title'
      profile['maintainer'].must_equal 'Chef'
      profile['copyright'].must_equal 'The Authors'
      profile['copyright_email'].must_equal 'joe@chef.io'
      profile['license'].must_equal 'Apache-2.0'
      profile['summary'].must_equal 'Someone wrote a summary'
      profile['version'].must_equal '0.5.1'
    end
  end

  Dir.glob("#{tmpdir}/inspecwith*").each {|i| FileUtils.remove_entry_secure(i) }
  Dir.glob("#{tmpdir}/options*").each {|i| FileUtils.remove_entry_secure(i) }
end
