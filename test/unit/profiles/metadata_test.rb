require 'helper'
require 'inspec/metadata'

describe 'metadata with supported operating systems' do
  let(:logger) { Minitest::Mock.new }
  let(:empty_options) { {} }

  def supports_meta(params)
    res = Inspec::Metadata.from_yaml('mock', "---", nil, logger)
    # manually inject supported parameters
    res.params[:supports] = params
    Inspec::Metadata.finalize(res, 'mock', empty_options, logger)
    res
  end

  describe 'running on ubuntu 14.04' do
    let (:backend) { MockLoader.new(:ubuntu1404).backend }

    it 'provides all metadata content' do
      s = "---\nname: hello #{rand}"
      res = Inspec::Metadata.from_yaml('mock', s, nil)
      Inspec::Metadata.finalize(res, 'mock', empty_options)
      res.content.must_equal(s)
    end

    it 'renders a YAML containing ERB' do
      data = <<EOF
      name: dummy
      title: InSpec Profile
      maintainer: The Authors
      copyright: The Authors
      copyright_email: you@example.com
      license: Apache-2.0
      summary: An InSpec Compliance Profile
      version: 0.1.0
      depends:
      - name: inherit
        url: "https://artifactory.com/artifactory/example-repo-local/inspec/0.4.1.tar.gz"
        username: <%= ENV['USERNAME'] %>
        password: <%= ENV['API_KEY'] %>
EOF
    ENV['USERNAME'] = 'dummy_user'
    ENV['API_KEY'] = 'dummy_pass'
    res = Inspec::Metadata.from_yaml('mock', data, nil)
    Inspec::Metadata.finalize(res, 'mock', empty_options)
    res.params[:name].must_equal 'mock'
    res.params[:depends][0][:name].must_equal 'inherit'
    res.params[:depends][0][:url].must_equal 'https://artifactory.com/artifactory/example-repo-local/inspec/0.4.1.tar.gz'
    res.params[:depends][0][:username].must_equal 'dummy_user'
    res.params[:depends][0][:password].must_equal 'dummy_pass'
    end

    it 'finalizes a loaded metadata via Profile ID' do
      res = Inspec::Metadata.from_yaml('mock', '---', nil)
      Inspec::Metadata.finalize(res, 'mock', empty_options)
      res.params[:name].must_equal('mock')
    end

    it 'finalizes a loaded metadata via Profile ID and overwrites the ID' do
      res = Inspec::Metadata.from_yaml('mock', "---\nname: hello", nil)
      Inspec::Metadata.finalize(res, 'mock', empty_options)
      res.params[:name].must_equal('mock')
    end

    it 'reads the version from metadata' do
      res = Inspec::Metadata.from_yaml('mock', "---\nversion: '1.1.0'", nil)
      Inspec::Metadata.finalize(res, 'mock', empty_options)
      res.params[:version].must_equal('1.1.0')
      res.valid_version?(res.params[:version]).must_equal(true)
    end

    it 'does not accept invalid version from metadata' do
      res = Inspec::Metadata.from_yaml('mock', "---\nversion: '1.1.0.1'", nil)
      Inspec::Metadata.finalize(res, 'mock', empty_options)
      res.params[:version].must_equal('1.1.0.1')
      res.valid_version?(res.params[:version]).must_equal(false)
    end

    it 'finalizes a loaded metadata by turning strings into symbols' do
      res = Inspec::Metadata.from_yaml('mock', "---\nauthor: world", nil)
      Inspec::Metadata.finalize(res, 'mock', empty_options)
      res.params[:author].must_equal('world')
    end

    it 'sets a default name with the original target if there is no name, title, or profile_id' do
      res = Inspec::Metadata.from_yaml('mock', '---', nil, logger)
      options = { target: '/path/to/tests' }
      Inspec::Metadata.finalize(res, nil, options, logger)
      res.params[:name].must_equal('tests from .path.to.tests')
    end

    it 'does not overwrite an existing name when name exists and profile_id is nil' do
      res = Inspec::Metadata.from_yaml('mock', "\nname: my_name", nil)
      options = { target: '/path/to/tests' }
      Inspec::Metadata.finalize(res, nil, options, logger)
      res.params[:name].must_equal('my_name')
    end

    it 'does not set a default name if a title is provided and profile_id is nil' do
      res = Inspec::Metadata.from_yaml('mock', "\ntitle: my_title", nil)
      options = { target: '/path/to/tests' }
      Inspec::Metadata.finalize(res, nil, options, logger)
      res.params[:title].must_equal('my_title')
      res.params[:name].must_be_nil
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
      m.supports_platform?(backend).must_equal true
    end

    it 'loads a profile which supports os ubuntu' do
      m = supports_meta({ 'os' => 'ubuntu' })
      m.supports_platform?(backend).must_equal true
    end

    it 'loads a profile which supports os name ubuntu' do
      m = supports_meta({ 'os-name' => 'ubuntu' })
      m.supports_platform?(backend).must_equal true
    end

    it 'loads a profile which supports os family linux' do
      m = supports_meta({ 'os-family' => 'linux' })
      m.supports_platform?(backend).must_equal true
    end

    it 'loads a profile which supports release 14.04' do
      m = supports_meta({ 'release' => '14.04' })
      m.supports_platform?(backend).must_equal true
    end

    it 'rejects a profile which supports release 12.04' do
      m = supports_meta({ 'release' => '12.04' })
      m.supports_platform?(backend).must_equal false
    end

    it 'loads a profile which supports ubuntu 14.04' do
      m = supports_meta({ 'os-name' => 'ubuntu', 'release' => '14.04' })
      m.supports_platform?(backend).must_equal true
    end

    it 'loads a profile which supports ubuntu 14.*' do
      m = supports_meta({ 'os-name' => 'ubuntu', 'release' => '14.*' })
      m.supports_platform?(backend).must_equal true
    end

    it 'rejects a profile which supports ubuntu 12.04' do
      m = supports_meta({ 'os-name' => 'ubuntu', 'release' => '12.04' })
      m.supports_platform?(backend).must_equal false
    end

    it 'rejects a profile which supports ubuntu 12.*' do
      m = supports_meta({ 'os-name' => 'ubuntu', 'release' => '12.*' })
      m.supports_platform?(backend).must_equal false
    end

    it 'loads a profile which supports ubuntu float 14.04 as parsed by yml' do
      m = supports_meta({ 'os-name' => 'ubuntu', 'release' => 14.04 })
      m.supports_platform?(backend).must_equal true
    end

    it 'reject unsupported os' do
      m = supports_meta({ 'os-name' => 'windows' })
      m.supports_platform?(backend).must_equal false
    end

    it 'loads a profile which supports multiple families' do
      m = supports_meta([
        { 'os-family' => 'windows' },
        { 'os-family' => 'unix' }
      ])
      m.supports_platform?(backend).must_equal true
    end

    it 'loads a profile which supports multiple names' do
      m = supports_meta([
        { 'os-family' => 'windows', 'os-name' => 'windows_2000'},
        { 'os-family' => 'unix', 'os-name' => 'ubuntu' }
      ])
      m.supports_platform?(backend).must_equal true
    end

    it 'reject a profile which supports multiple families' do
      m = supports_meta([
        { 'os-family' => 'windows' },
        { 'os-family' => 'redhat' }
      ])
      m.supports_platform?(backend).must_equal false
    end
  end

  describe 'testing the supported runtime' do
    let(:current_version) { Inspec::VERSION }
    let(:next_version) { Gem::Version.new(current_version).bump.to_s }

    def version_meta(params)
      res = Inspec::Metadata.from_yaml('mock', "---", nil, logger)
      res.params[:inspec_version] = params
      Inspec::Metadata.finalize(res, 'mock', empty_options, logger)
      res
    end

    it 'returns true on testing the current version' do
      m = version_meta(current_version)
      m.supports_runtime?.must_equal true
    end

    it 'returns true on testing the current version' do
      m = version_meta('= ' + current_version)
      m.supports_runtime?.must_equal true
    end

    it 'returns true on testing >= current version' do
      m = version_meta('>= ' + current_version)
      m.supports_runtime?.must_equal true
    end

    it 'returns false on testing >= the next version' do
      m = version_meta('>= ' + next_version)
      m.supports_runtime?.must_equal false
    end

    it 'returns false on testing > the next version' do
      m = version_meta('> ' + next_version)
      m.supports_runtime?.must_equal false
    end
  end
end
