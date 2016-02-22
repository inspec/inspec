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
    let(:mock_file) { mock_file = MockLoader.profile_tgz('complete-profile') }
    let(:target) { Inspec::Fetcher.resolve(mock_file) }
    let(:res) { Inspec::SourceReader.resolve(target) }

    it 'resolves the target to inspec' do
      _(res).must_be_kind_of reader
    end

    it 'retrieves metadata' do
      _(res.metadata.params[:name]).must_equal 'complete'
    end

    it 'retrieves all files' do
      _(res.tests.keys).must_equal %w{controls/filesystem_spec.rb}
      _(res.tests.values[0]).must_match /^control 'test01' do$/
    end

    it 'retrieves all libraries' do
      _(res.libraries.keys).must_equal %w{libraries/testlib.rb}
      _(res.libraries.values[0]).must_match /^# Library resource$/
    end
  end
end
