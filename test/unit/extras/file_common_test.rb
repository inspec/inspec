# encoding: utf-8
require 'helper'
require 'securerandom'
require 'train/extras/file_common'

describe 'file common' do
  let(:cls) { Train::Extras::FileCommon }

  def mockup(stubs)
    Class.new(cls) do
      stubs.each do |k,v|
        define_method k.to_sym do
          v
        end
      end
    end.new
  end

  it 'has the default type of unknown' do
    cls.new.type.must_equal :unknown
  end

  it 'calculates md5sum from content' do
    content = 'hello world'
    cls.new.stub :content, content do |i|
      i.md5sum.must_equal '5eb63bbbe01eeed093cb22bb8f5acdc3'
    end
  end

  it 'sets md5sum of nil content to nil' do
    cls.new.stub :content, nil do |i|
      i.md5sum.must_be_nil
    end
  end

  it 'calculates md5sum from content' do
    content = 'hello world'
    cls.new.stub :content, content do |i|
      i.sha256sum.must_equal 'b94d27b9934d3e08a52e52d7da7dabfac484efe37a5380ee9088f7ace2efcde9'
    end
  end

  it 'sets sha256sum of nil content to nil' do
    cls.new.stub :content, nil do |i|
      i.sha256sum.must_be_nil
    end
  end

  describe 'type' do
    it 'recognized type == file' do
      fc = mockup(type: :file)
      fc.file?.must_equal true
    end

    it 'recognized type == block_device' do
      fc = mockup(type: :block_device)
      fc.block_device?.must_equal true
    end

    it 'recognized type == character_device' do
      fc = mockup(type: :character_device)
      fc.character_device?.must_equal true
    end

    it 'recognized type == socket' do
      fc = mockup(type: :socket)
      fc.socket?.must_equal true
    end

    it 'recognized type == directory' do
      fc = mockup(type: :directory)
      fc.directory?.must_equal true
    end

    it 'recognized type == pipe' do
      fc = mockup(type: :pipe)
      fc.pipe?.must_equal true
    end

    it 'recognized type == symlink' do
      fc = mockup(type: :symlink)
      fc.symlink?.must_equal true
    end
  end

  describe 'version' do
    it 'recognized wrong version' do
      fc = mockup(product_version: rand, file_version: rand)
      fc.version?(rand).must_equal false
    end

    it 'recognized product_version' do
      x = rand
      fc = mockup(product_version: x, file_version: rand)
      fc.version?(x).must_equal true
    end

    it 'recognized file_version' do
      x = rand
      fc = mockup(product_version: rand, file_version: x)
      fc.version?(x).must_equal true
    end
  end

  describe 'unix_mode_mask' do

    let(:fc) { mockup(type: :file) }

    it 'check owner mode calculation' do
      fc.unix_mode_mask('owner', 'x').must_equal 0100
      fc.unix_mode_mask('owner', 'w').must_equal 0200
      fc.unix_mode_mask('owner', 'r').must_equal 0400
    end

    it 'check group mode calculation' do
      fc.unix_mode_mask('group', 'x').must_equal 0010
      fc.unix_mode_mask('group', 'w').must_equal 0020
      fc.unix_mode_mask('group', 'r').must_equal 0040
    end

    it 'check other mode calculation' do
      fc.unix_mode_mask('other', 'x').must_equal 0001
      fc.unix_mode_mask('other', 'w').must_equal 0002
      fc.unix_mode_mask('other', 'r').must_equal 0004
    end

    it 'check all mode calculation' do
      fc.unix_mode_mask('all', 'x').must_equal 0111
      fc.unix_mode_mask('all', 'w').must_equal 0222
      fc.unix_mode_mask('all', 'r').must_equal 0444
    end
  end
end
