# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'functional/helper'

# basic testing without availability of any server
describe 'inspec compliance' do
  include FunctionalHelper

  it 'help' do
    out = inspec('compliance help')
    out.exit_status.must_equal 0
    out.stdout.must_include 'inspec compliance exec PROFILE'
  end

  # ensure we are logged out
  it 'logout' do
    out = inspec('compliance logout')
    out.exit_status.must_equal 0
    out.stdout.must_include ''
  end

  it 'login server url missing' do
    out = inspec('compliance login')
    out.exit_status.must_equal 1
    out.stderr.must_include 'ERROR: "inspec login" was called with no arguments'
  end

  it 'inspec compliance profiles without authentication' do
    out = inspec('compliance profile')
    out.stdout.must_include 'You need to login first with `inspec compliance login`'
    out.exit_status.must_equal 0
  end

  it 'try to upload a profile without directory' do
    out = inspec('compliance upload')
    out.stderr.must_include 'ERROR: "inspec upload" was called with no arguments'
    out.exit_status.must_equal 1
  end

  it 'try to upload a profile a non-existing path' do
    out = inspec('compliance upload /path/to/dir')
    out.stdout.must_include 'You need to login first with `inspec compliance login`'
    out.exit_status.must_equal 0
  end

  it 'logout' do
    out = inspec('compliance logout')
    out.exit_status.must_equal 0
    out.stdout.must_include ''
  end
end
