# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'
require 'inspec/metadata'

describe 'metadata with supported operating systems' do
  let(:logger) { Minitest::Mock.new }

  def supports_meta(params)
    res = Inspec::Metadata.from_yaml('mock', "---", nil, logger)
    # manually inject supported parameters
    res.params[:supports] = params
    Inspec::Metadata.finalize(res, 'mock', logger)
    res
  end

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
      res.params[:supports].must_equal([{ os: 'ubuntu' }])
    end

    it 'makes sure the supports release field is a string' do
      res = Inspec::Metadata.from_yaml('mock',
        "---\nsupports:\n  - release: 12.02", nil)
      res.params[:supports].must_equal([{ release: '12.02' }])
    end

    it 'makes sure the supports release field is nil if not configured' do
      res = Inspec::Metadata.from_yaml('mock',
        "---\nsupports:\n  - release: ", nil)
      res.params[:supports].must_equal([{ release: nil }])
    end

    it 'load a profile with empty supports clause' do
      m = supports_meta(nil)
      m.supports_transport?(backend).must_equal true
    end

    it 'supports legacy simple support style, but warns' do
      # i.e. setting this to something that would fail:
      logger.expect :warn, nil, ["Do not use deprecated `supports: linux` syntax. Instead use:\nsupports:\n  - os-family: linux\n\n"]
      m = supports_meta('linux')
      m.supports_transport?(backend).must_equal true
      logger.verify
    end

    it 'supports legacy simple support style, but warns' do
      # i.e. setting this to something that would fail:
      logger.expect :warn, nil, ["Do not use deprecated `supports: linux` syntax. Instead use:\nsupports:\n  - os-family: linux\n\n"]
      m = supports_meta(['linux'])
      m.supports_transport?(backend).must_equal true
      logger.verify
    end

    it 'loads a profile which supports os ubuntu' do
      m = supports_meta({ 'os' => 'ubuntu' })
      m.supports_transport?(backend).must_equal true
    end

    it 'loads a profile which supports os name ubuntu' do
      m = supports_meta({ 'os-name' => 'ubuntu' })
      m.supports_transport?(backend).must_equal true
    end

    it 'loads a profile which supports os family linux' do
      m = supports_meta({ 'os-family' => 'linux' })
      m.supports_transport?(backend).must_equal true
    end

    it 'loads a profile which supports release 14.04' do
      m = supports_meta({ 'release' => '14.04' })
      m.supports_transport?(backend).must_equal true
    end

    it 'rejects a profile which supports release 12.04' do
      m = supports_meta({ 'release' => '12.04' })
      m.supports_transport?(backend).must_equal false
    end

    it 'loads a profile which supports ubuntu 14.04' do
      m = supports_meta({ 'os-name' => 'ubuntu', 'release' => '14.04' })
      m.supports_transport?(backend).must_equal true
    end

    it 'rejects a profile which supports ubuntu 12.04' do
      m = supports_meta({ 'os-name' => 'ubuntu', 'release' => '12.04' })
      m.supports_transport?(backend).must_equal false
    end

    it 'loads a profile which supports ubuntu float 14.04 as parsed by yml' do
      m = supports_meta({ 'os-name' => 'ubuntu', 'release' => 14.04 })
      m.supports_transport?(backend).must_equal true
    end

    it 'reject unsupported os' do
      m = supports_meta({ 'os-name' => 'windows' })
      m.supports_transport?(backend).must_equal false
    end
  end

  describe 'testing the supported runtime' do
    let(:current_version) { Inspec::VERSION }
    let(:next_version) { Gem::Version.new(current_version).bump.to_s }

    it 'returns true on testing the current version' do
      m = supports_meta({ 'inspec' => current_version })
      m.supports_runtime?.must_equal true
    end

    it 'returns true on testing the current version' do
      m = supports_meta({ 'inspec' => '= ' + current_version })
      m.supports_runtime?.must_equal true
    end

    it 'returns true on testing >= current version' do
      m = supports_meta({ 'inspec' => '>= ' + current_version })
      m.supports_runtime?.must_equal true
    end

    it 'returns false on testing >= the next version' do
      m = supports_meta({ 'inspec' => '>= ' + next_version })
      m.supports_runtime?.must_equal false
    end

    it 'returns false on testing > the next version' do
      m = supports_meta({ 'inspec' => '> ' + next_version })
      m.supports_runtime?.must_equal false
    end
  end
end
