# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'

describe 'inspec keyword' do
  def load(content)
    runner = Inspec::Runner.new({backend: 'mock'})
    res = runner.eval_with_virtual_profile(content)
  end

  it 'is a vailable as a global keyword' do
    load('inspec') # wont raise anything
  end

  it 'is a vailable inside of control blocks' do
    load('control 1 do inspec end') # wont raise anything
  end

  it 'is associated with resources' do
    i = load('os.inspec')
    i.wont_be_nil
    i.backend.must_be_kind_of Train::Transports::Mock::Connection
  end

  it 'prints a nice to_s' do
    load('inspec').to_s.must_equal 'Inspec::Backend::Class'
  end

  it 'prints a nice inspect line' do
    load('inspec').inspect.must_equal 'Inspec::Backend::Class @transport=Train::Transports::Mock::Connection'
  end
end
