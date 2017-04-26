# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'

describe SourceReaders::Flat do
  let(:reader) { SourceReaders::Flat }

  it 'registers with the source readers registry' do
    reg = Inspec::SourceReader.registry
    _(reg['flat']).must_equal reader
  end

  describe 'with a flat file' do
    let(:target) { Inspec::FileProvider.for_path(__FILE__) }
    let(:res) { Inspec::SourceReader.resolve(target.relative_provider) }

    it 'resolves the target' do
      _(res).must_be_kind_of reader
    end

    it 'has no metadata' do
      _(res.metadata.params).must_equal({})
    end

    it 'retrieves all files' do
      _(res.tests.keys).must_equal [File.basename(__FILE__)]
      _(res.tests.values[0]).must_equal File.read(__FILE__)
    end

    it 'has no libraries' do
      _(res.libraries).must_be_empty
    end

    it 'has no files' do
      _(res.data_files).must_be_empty
    end
  end

  describe 'with a flat folder' do
    let(:target) { Inspec::FileProvider.for_path(File.dirname(__FILE__)) }
    let(:res) { Inspec::SourceReader.resolve(target.relative_provider) }

    it 'resolves the target' do
      _(res).must_be_kind_of reader
    end

    it 'has no metadata' do
      _(res.metadata.params).must_equal({})
    end

    it 'retrieves all files' do
      dir = File.dirname(__FILE__)
      full_files = Dir[File.join(dir, '**')]
      files = full_files.map { |x| x.sub(dir+'/', '') }
      _(res.tests.keys).must_equal files
      _(res.tests.values[0]).must_equal File.read(full_files[0])
    end

    it 'has no libraries' do
      _(res.libraries).must_be_empty
    end
  end
end
