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
    #TODO: we need to convince thor that this is an error
    out.exit_status.must_equal 0
    out.stderr.must_include 'ERROR: "inspec login" was called with no arguments'
  end

  it 'login server with missing parameters' do
    out = inspec('compliance login http://example.com')
    out.exit_status.must_equal 1
    #TODO: inspec should really use stderr for errors
    out.stdout.must_include 'Please run `inspec compliance login` with options'
  end

  it 'inspec compliance profiles without authentication' do
    out = inspec('compliance profile')
    out.exit_status.must_equal 1
  end

  it 'try to upload a profile without directory' do
    out = inspec('compliance upload')
    out.stderr.must_include 'ERROR: "inspec upload" was called with no arguments'
    out.exit_status.must_equal 0
  end

  it 'try to upload a profile a non-existing path' do
    out = inspec('compliance upload /path/to/dir')
    out.stdout.must_include 'Directory /path/to/dir does not exist.'
    out.exit_status.must_equal 1
  end

  it 'logout' do
    out = inspec('compliance logout')
    out.exit_status.must_equal 0
    out.stdout.must_include ''
  end
end
