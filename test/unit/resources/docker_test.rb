# encoding: utf-8
# author: Christoph Hartmann

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::Docker' do
  describe 'docker' do
    it 'check docker container parsing' do
      resource = load_resource('docker')
      _(resource.containers.ids).must_equal ['3def9aa450f8bd772c3d5b07e27ec934e5f58575e955367a0aca2d93e0687536', 'd94f854370d2b02912e8fc636502bc72b74fbd567a7eba3fc6a52045bb28904e']
      _(resource.containers.names).must_equal ['sleepy_khorana', 'laughing_austin']
    end

    it 'check docker image parsing' do
      resource = load_resource('docker')
      _(resource.images.ids).must_equal ['sha256:4a415e3663882fbc554ee830889c68a33b3585503892cc718a4698e91ef2a526', 'sha256:978d85d02b87aea199e4ae8664f6abf32fdea331884818e46b8a01106b114cee', 'sha256:0ef2e08ed3fabfc44002ccb846c4f2416a2135affc3ce39538834059606f32dd']
      _(resource.images.repositories).must_equal ["alpine", "debian", "ubuntu"]
    end

    it 'check docker version parsing' do
      resource = load_resource('docker')
      _(resource.version.Server.Version).must_equal '17.03.0-ce'
      _(resource.version.Client.Version).must_equal '17.03.0-ce'
    end

    it 'check docker info parsing' do
      resource = load_resource('docker')
      _(resource.info.ID).must_equal 'HMKB:SOFR:Z3DM:J6ZY:WE6K:47EW:WVGV:C5C3:WNJC:TSG6:43YV:IOGU'
      _(resource.info.Containers).must_equal 93
      _(resource.info.Runtimes.runc.path).must_equal 'docker-runc'
      _(resource.info.SecurityOptions).must_equal ["name=seccomp,profile=default"]
    end

    it 'check docker object parsing' do
      resource = load_resource('docker')
      _(resource.object('71b5df59442b').Id).must_equal '71b5df59442be8215902ce7804bfbb0ab5d8b8ddab7cef6e00224a8c1f476e38'
      _(resource.object('71b5df59442b').Path).must_equal 'nginx'
    end

    it 'prints as a docker resource' do
      resource = load_resource('docker')
      resource.to_s.must_equal 'Docker Host'
    end
  end
end
