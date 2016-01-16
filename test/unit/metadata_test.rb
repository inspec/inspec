# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'
require 'inspec/metadata'

describe 'metadata with supported operating systems' do
  let(:logger) { Minitest::Mock.new }

  describe 'running on ubuntu 14.04' do
    let (:backend) { MockLoader.new(:ubuntu1404).backend }

    it 'finalizes a loaded metadata via Profile ID' do
      res = Inspec::Metadata.from_yaml('mock', '---', nil)
      Inspec::Metadata.finalize(res, 'mock')
      res.params[:name].must_equal('mock')
    end

    it 'finalizes a loaded metadata via Profile ID and overwrites the ID' do
      res = Inspec::Metadata.from_yaml('mock', "---\nname: hello", nil)
      Inspec::Metadata.finalize(res, 'mock')
      res.params[:name].must_equal('mock')
    end

    it 'finalizes a loaded metadata by turning strings into symbols' do
      res = Inspec::Metadata.from_yaml('mock', "---\nauthor: world", nil)
      Inspec::Metadata.finalize(res, 'mock')
      res.params[:author].must_equal('world')
    end

    it 'loads the support field from metadata' do
      res = Inspec::Metadata.from_yaml('mock',
        "---\nsupports:\n  - os: ubuntu", nil)
      res.params[:supports].must_equal([{ 'os' => 'ubuntu' }])
    end

    # Description of method
    #
    # @param [Type] params describe params
    # @return [Type] description of returned object
    def create_meta(params)
      res = Inspec::Metadata.from_yaml('mock', "---", nil, logger)
      # manually inject supported parameters
      res.params[:supports] = params
      Inspec::Metadata.finalize(res, 'mock')
      res
    end

    it 'load a profile with empty supports clause' do
      m = create_meta(nil)
      m.supports_transport?(backend).must_equal true
    end

    it 'supports legacy simple support style, but warns' do
      # i.e. setting this to something that would fail:
      m = create_meta('linux')
      logger.expect :warn, nil, [
        'Do not use deprecated `supports: linux` '\
        'syntax. Instead use `supports: {os-family: linux}`.']
      m.supports_transport?(backend).must_equal true
      logger.verify
    end

    it 'loads a profile which supports os ubuntu' do
      m = create_meta({ 'os' => 'ubuntu' })
      m.supports_transport?(backend).must_equal true
    end

    it 'loads a profile which supports os name ubuntu' do
      m = create_meta({ 'os-name' => 'ubuntu' })
      m.supports_transport?(backend).must_equal true
    end

    it 'loads a profile which supports os family linux' do
      m = create_meta({ 'os-family' => 'linux' })
      m.supports_transport?(backend).must_equal true
    end

    it 'loads a profile which supports release 14.04' do
      m = create_meta({ 'release' => '14.04' })
      m.supports_transport?(backend).must_equal true
    end

    it 'rejects a profile which supports release 12.04' do
      m = create_meta({ 'release' => '12.04' })
      m.supports_transport?(backend).must_equal false
    end

    it 'loads a profile which supports ubuntu 14.04' do
      m = create_meta({ 'os-name' => 'ubuntu', 'release' => '14.04' })
      m.supports_transport?(backend).must_equal true
    end

    it 'rejects a profile which supports ubuntu 12.04' do
      m = create_meta({ 'os-name' => 'ubuntu', 'release' => '12.04' })
      m.supports_transport?(backend).must_equal false
    end

    it 'reject unsupported os' do
      m = create_meta({ 'os-name' => 'windows' })
      m.supports_transport?(backend).must_equal false
    end
  end
end
