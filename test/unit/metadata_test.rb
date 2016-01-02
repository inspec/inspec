# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'
require 'inspec/metadata'

describe 'metadata with supported operating systems' do
  describe 'running on ubuntu 14.04' do
    let (:backend) { MockLoader.new(:ubuntu1404).backend }

    # Description of method
    #
    # @param [Type] params describe params
    # @return [Type] description of returned object
    def create_meta(params)
      res = Inspec::Metadata.from_yaml('mock', "---", nil)
      # manually inject supported parameters
      res.params[:supports] = params
      Inspec::Metadata.finalize(res, 'mock')
      res
    end

    it 'load a profile with empty supports clause' do
      m = create_meta(nil)
      m.supports_transport?(backend).must_equal true
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
