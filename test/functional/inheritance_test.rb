# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'functional/helper'

describe 'example inheritance profile' do
  include FunctionalHelper
  let(:path) { File.join(examples_path, 'inheritance') }

  [
    'archive %s --overwrite',
    'check %s',
    'json %s',
  ].each do |cmd|
    it cmd[/^\w/] + ' fails without --profiles-path' do
      out = inspec(format(cmd, path))
      out.stderr.must_include 'You must supply a --profiles-path to inherit'
      # out.stdout.must_equal '' => we still get partial output
      out.exit_status.must_equal 1
    end
  end

  it 'check succeeds with --profiles-path' do
    out = inspec('check ' + path + ' --profiles-path ' + examples_path)
    out.stderr.must_equal ''
    out.stdout.must_match /Valid.*true/
    out.exit_status.must_equal 0
  end

  it 'archive is successful with --profiles-path' do
    out = inspec('archive ' + path + ' --output ' + dst.path + ' --profiles-path ' + examples_path)
    out.stderr.must_equal ''
    out.stdout.must_include 'Generate archive '+dst.path
    out.stdout.must_include 'Finished archive generation.'
    out.exit_status.must_equal 0
    File.exist?(dst.path).must_equal true
  end

  it 'read the profile json with --profiles-path' do
    out = inspec('json ' + path + ' --profiles-path '+examples_path)
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    s = out.stdout
    hm = JSON.load(s)
    hm['name'].must_equal 'inheritance'
    hm['rules'].length.must_equal 1 # TODO: flatten out or search deeper!
  end
end
