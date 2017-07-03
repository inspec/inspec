# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/resource'

describe Inspec::Resources::Cmd do
  let(:x) { rand.to_s }
  def resource(y)
    load_resource('command', y)
  end

  it 'prints as a bash command' do
    resource(x).to_s.must_equal 'Command '+x
  end

  it 'runs a valid mocked command' do
    resource('env').result.wont_be_nil
    resource('env').stdout.must_equal "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\n"
    resource('env').stderr.must_equal ''
    resource('env').exit_status.must_equal 0
  end

  it 'raises when called with nil as a command' do
    proc { resource(nil).result }.must_raise StandardError
  end
end
