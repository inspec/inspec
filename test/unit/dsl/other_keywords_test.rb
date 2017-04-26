# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'

describe 'inspec keyword' do
  def load(content)
    runner = Inspec::Runner.new({backend: 'mock'})
    res = runner.eval_with_virtual_profile(content)
  end

  def load_in_profile(cmd)
    MockLoader.load_profile('complete-profile').runner_context.load(cmd)
  end

  it 'is a vailable as a global keyword' do
    load('inspec') # wont raise anything
  end

  it 'is a vailable inside of control blocks' do
    load('control 1 do inspec end') # wont raise anything
  end

  it 'provides version information' do
    load('inspec.version').must_equal Inspec::VERSION
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

  describe 'inspec.profile.files' do
    it 'lists an empty array when calling #files without any files loaded' do
      load('inspec.profile.files').must_equal([])
    end

    it 'lists all profile files when calling #files' do
      load_in_profile('inspec.profile.files').must_equal %w{items.conf}
    end
  end

  describe 'inspec.profile.file' do
    it 'raises an error if a file was not found' do
      proc { load('inspec.profile.file("test")') }.must_raise RuntimeError
    end

    it 'provides file contents when calling file(...)' do
      load_in_profile('inspec.profile.file("items.conf")').must_equal "one\ntwo\nthree\n"
    end
  end
end
