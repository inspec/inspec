# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'

describe SourceReaders::InspecReader do
  let(:reader) { SourceReaders::InspecReader }

  it 'registers with the source readers registry' do
    reg = Inspec::SourceReader.registry
    _(reg['inspec']).must_equal reader
  end

  describe 'with a valid profile' do
    let(:mock_file) { MockLoader.profile_tgz('complete-profile') }
    let(:target) { Inspec::FileProvider.for_path(mock_file) }
    let(:res) { Inspec::SourceReader.resolve(target) }

    it 'resolves the target to inspec' do
      _(res).must_be_kind_of reader
    end

    it 'retrieves metadata' do
      _(res.metadata.params[:name]).must_equal 'complete'
    end

    it 'retrieves all files' do
      _(res.tests.keys).must_equal %w{controls/filesystem_spec.rb}
      _(res.tests.values[0]).must_match(/^control 'test01' do$/)
    end

    it 'retrieves all libraries' do
      _(res.libraries.keys).must_equal %w{libraries/testlib.rb}
      _(res.libraries.values[0]).must_match(/^# Library resource$/)
    end

    it 'retrieves all extra files' do
      _(res.data_files.keys).must_equal %w{files/items.conf}
      _(res.data_files.values[0]).must_equal "one\ntwo\nthree\n"
    end
  end

  describe 'with an invalid inspec.yml' do
    let(:mock_file) { MockLoader.profile_tgz('profile-with-bad-metadata') }
    let(:target) { Inspec::FileProvider.for_path(mock_file) }
    let(:res) { Inspec::SourceReader.resolve(target) }

    it 'raises an exception' do
      err = proc { _(res.metadata) }.must_raise RuntimeError
      err.message.must_match(/Unable to parse inspec\.yml: line \d+/)
    end
  end
end
