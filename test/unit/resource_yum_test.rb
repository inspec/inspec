# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::YumRepo' do
  let(:resource) { MockLoader.new(:centos7).load_resource('yum') }

  it 'get repository details' do
    _(resource.repositories).must_equal [{
      'id'=>'base/7/x86_64',
      'name'=>'CentOS-7 - Base',
      'status'=>'enabled',
      'revision'=>'1427842153',
      'updated'=>'Tue Mar 31 22:50:46 2015',
      'pkgs'=>'8652',
      'size'=>'6.3 G',
      'mirrors'=>'http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=os&infra=stock',
      'baseurl'=>'http://ftp.hosteurope.de/mirror/centos.org/7.1.1503/os/x86_64/ (9 more)',
      'expire'=>'21600 second(s) (last: Sun Sep  6 10:20:46 2015)',
      'filename'=>'/etc/yum.repos.d/CentOS-Base.repo',
    }, {
      'id'=>'base-debuginfo/x86_64',
      'name'=>'CentOS-7 - Debuginfo',
      'status'=>'disabled',
      'baseurl'=>'http://debuginfo.centos.org/7/x86_64/',
      'expire'=>'21600 second(s) (last: Unknown)',
      'filename'=>'/etc/yum.repos.d/CentOS-Debuginfo.repo',
    }, {
      'id'=>'extras/7/x86_64',
      'name'=>'CentOS-7 - Extras',
      'status'=>'enabled',
      'revision'=>'1441314199',
      'updated'=>'Thu Sep  3 21:03:33 2015',
      'pkgs'=>'181',
      'size'=>'742 M',
      'mirrors'=>'http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=extras&infra=stock',
      'baseurl'=>'http://mirror.informatik.hs-fulda.de/centos7.1.1503/extras/x86_64/ (9 more)',
      'expire'=>'21600 second(s) (last: Sun Sep  6 10:20:48 2015)',
      'filename'=>'/etc/yum.repos.d/CentOS-Base.repo',
    }]
    _(resource.repos.length).must_equal 3
  end

  it 'get repository details' do
    _(resource.repos).must_equal %w{base/7/x86_64 base-debuginfo/x86_64 extras/7/x86_64}
  end

  #  its('epel') { should exist }
  #  its('epel') { should be_enabled }
  it 'test its syntax repo' do
    _(resource.extras.exist?).must_equal true
    _(resource.extras.enabled?).must_equal true
  end

  it 'test enabled extra repo' do
    extras = resource.repo('extras/7/x86_64')
    _(extras.exist?).must_equal true
    _(extras.enabled?).must_equal true
  end

  it 'test enabled extra repo with short name' do
    extras = resource.repo('extras')
    _(extras.exist?).must_equal true
    _(extras.enabled?).must_equal true
  end

  it 'test disabled extra-source repo' do
    extras = resource.repo('base-debuginfo/x86_64')
    _(extras.exist?).must_equal true
    _(extras.enabled?).must_equal false
  end

  # test serverspec syntax
  let(:serverspec) { load_resource('yumrepo', 'extras') }
  it 'test enabled extra repo (serverspec backwards comptability)' do
    _(serverspec.exists?).must_equal true
    _(serverspec.enabled?).must_equal true
  end
end
