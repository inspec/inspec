require 'functional/helper'
require 'fileutils'
require 'tmpdir'

describe 'inspec init' do
  include FunctionalHelper

  tmpdir = Dir.tmpdir
  puts tmpdir

  describe 'inspec init profile with/slash' do
    it 'prevents profile names without valid characters' do
      out = inspec("init profile #{tmpdir}/inspecwith/slash")
      out.exit_status.must_equal 0
    end

    it 'allows profile names with valid characters' do
      out = inspec("init profile #{tmpdir}/inspecwithoutslash")
      out.exit_status.must_equal 0
    end
  end

  Dir.glob("#{tmpdir}/inspecwith*").each {|i| FileUtils.remove_entry_secure(i) }
end
