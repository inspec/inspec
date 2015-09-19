# encoding: utf-8

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::YumRepo' do
  describe 'yum' do
    let(:resource) { loadResource('yum') }

    it 'get repository details' do
      _(resource.repositories).must_equal [{
        'id'=>'C7.0.1406-base/x86_64',
        'name'=>'CentOS-7.0.1406 - Base',
        'status'=>'disabled',
        'baseurl'=>'http://vault.centos.org/7.0.1406/os/x86_64/',
        'expire'=>'21600 second(s) (last: Unknown)',
        'filename'=>'/etc/yum.repos.d/CentOS-Vault.repo'
      }, {
        'id'=>'C7.0.1406-centosplus/x86_64',
        'name'=>'CentOS-7.0.1406 - CentOSPlus',
        'status'=>'disabled',
        'baseurl'=>'http://vault.centos.org/7.0.1406/centosplus/x86_64/',
        'expire'=>'21600 second(s) (last: Unknown)',
        'filename'=>'/etc/yum.repos.d/CentOS-Vault.repo'
      }, {
        'id'=>'C7.0.1406-extras/x86_64',
        'name'=>'CentOS-7.0.1406 - Extras',
        'status'=>'disabled',
        'baseurl'=>'http://vault.centos.org/7.0.1406/extras/x86_64/',
        'expire'=>'21600 second(s) (last: Unknown)',
        'filename'=>'/etc/yum.repos.d/CentOS-Vault.repo'
      }, {
        'id'=>'C7.0.1406-fasttrack/x86_64',
        'name'=>'CentOS-7.0.1406 - CentOSPlus',
        'status'=>'disabled',
        'baseurl'=>'http://vault.centos.org/7.0.1406/fasttrack/x86_64/',
        'expire'=>'21600 second(s) (last: Unknown)',
        'filename'=>'/etc/yum.repos.d/CentOS-Vault.repo'
      }, {
        'id'=>'C7.0.1406-updates/x86_64',
        'name'=>'CentOS-7.0.1406 - Updates',
        'status'=>'disabled',
        'baseurl'=>'http://vault.centos.org/7.0.1406/updates/x86_64/',
        'expire'=>'21600 second(s) (last: Unknown)',
        'filename'=>'/etc/yum.repos.d/CentOS-Vault.repo'
      }, {
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
        'filename'=>'/etc/yum.repos.d/CentOS-Base.repo'
      }, {
        'id'=>'base-debuginfo/x86_64',
        'name'=>'CentOS-7 - Debuginfo',
        'status'=>'disabled',
        'baseurl'=>'http://debuginfo.centos.org/7/x86_64/',
        'expire'=>'21600 second(s) (last: Unknown)',
        'filename'=>'/etc/yum.repos.d/CentOS-Debuginfo.repo'
      }, {
        'id'=>'base-source/7',
        'name'=>'CentOS-7 - Base Sources',
        'status'=>'disabled',
        'baseurl'=>'http://vault.centos.org/centos/7/os/Source/',
        'expire'=>'21600 second(s) (last: Unknown)', 'filename'=>'/etc/yum.repos.d/CentOS-Sources.repo'
      }, {
        'id'=>'centosplus/7/x86_64',
        'name'=>'CentOS-7 - Plus',
        'status'=>'disabled',
        'mirrors'=>'http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=centosplus&infra=stock',
        'expire'=>'21600 second(s) (last: Unknown)',
        'filename'=>'/etc/yum.repos.d/CentOS-Base.repo'
      }, {
        'id'=>'centosplus-source/7',
        'name'=>'CentOS-7 - Plus Sources',
        'status'=>'disabled',
        'baseurl'=>'http://vault.centos.org/centos/7/centosplus/Source/',
        'expire'=>'21600 second(s) (last: Unknown)',
        'filename'=>'/etc/yum.repos.d/CentOS-Sources.repo'
      }, {
        'id'=>'cr/7/x86_64',
        'name'=>'CentOS-7 - cr',
        'status'=>'disabled',
        'baseurl'=>'http://mirror.centos.org/centos/7/cr/x86_64/',
        'expire'=>'21600 second(s) (last: Unknown)',
        'filename'=>'/etc/yum.repos.d/CentOS-CR.repo'
      }, {
        'id'=>'epel/x86_64',
        'name'=>'Extra Packages for Enterprise Linux 7 - x86_64',
        'status'=>'enabled',
        'revision'=>'1441506838',
        'tags'=>'binary-x86_64',
        'updated'=>'Sun Sep  6 03:42:49 2015',
        'pkgs'=>'8483',
        'size'=>'6.6 G',
        'metalink'=>'https://mirrors.fedoraproject.org/metalink?repo=epel-7&arch=x86_64',
        'baseurl'=>'http://ftp-stud.hs-esslingen.de/pub/epel/7/x86_64/ (66 more)',
        'expire'=>'21600 second(s) (last: Sun Sep  6 10:20:48 2015)',
        'filename'=>'/etc/yum.repos.d/epel.repo'
      }, {
        'id'=>'epel-debuginfo/x86_64',
        'name'=>'Extra Packages for Enterprise Linux 7 - x86_64 - Debug',
        'status'=>'disabled',
        'mirrors'=>'https://mirrors.fedoraproject.org/metalink?repo=epel-debug-7&arch=x86_64',
        'expire'=>'21600 second(s) (last: Unknown)',
        'filename'=>'/etc/yum.repos.d/epel.repo'
      }, {
        'id'=>'epel-source/x86_64',
        'name'=>'Extra Packages for Enterprise Linux 7 - x86_64 - Source',
        'status'=>'disabled',
        'mirrors'=>'https://mirrors.fedoraproject.org/metalink?repo=epel-source-7&arch=x86_64',
        'expire'=>'21600 second(s) (last: Unknown)',
        'filename'=>'/etc/yum.repos.d/epel.repo'
      }, {
        'id'=>'epel-testing/x86_64',
        'name'=>'Extra Packages for Enterprise Linux 7 - Testing - x86_64',
        'status'=>'disabled',
        'mirrors'=>'https://mirrors.fedoraproject.org/metalink?repo=testing-epel7&arch=x86_64',
        'expire'=>'21600 second(s) (last: Unknown)',
        'filename'=>'/etc/yum.repos.d/epel-testing.repo'
      }, {
        'id'=>'epel-testing-debuginfo/x86_64',
        'name'=>'Extra Packages for Enterprise Linux 7 - Testing - x86_64 - Debug',
        'status'=>'disabled',
        'mirrors'=>'https://mirrors.fedoraproject.org/metalink?repo=testing-debug-epel7&arch=x86_64',
        'expire'=>'21600 second(s) (last: Unknown)',
        'filename'=>'/etc/yum.repos.d/epel-testing.repo'
      }, {
        'id'=>'epel-testing-source/x86_64',
        'name'=>'Extra Packages for Enterprise Linux 7 - Testing - x86_64 - Source',
        'status'=>'disabled',
        'mirrors'=>'https://mirrors.fedoraproject.org/metalink?repo=testing-source-epel7&arch=x86_64',
        'expire'=>'21600 second(s) (last: Unknown)',
        'filename'=>'/etc/yum.repos.d/epel-testing.repo'
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
        'filename'=>'/etc/yum.repos.d/CentOS-Base.repo'
      }, {
        'id'=>'extras-source/7',
        'name'=>'CentOS-7 - Extras Sources',
        'status'=>'disabled',
        'baseurl'=>'http://vault.centos.org/centos/7/extras/Source/',
        'expire'=>'21600 second(s) (last: Unknown)',
        'filename'=>'/etc/yum.repos.d/CentOS-Sources.repo'
      }, {
        'id'=>'fasttrack/7/x86_64',
        'name'=>'CentOS-7 - fasttrack',
        'status'=>'disabled',
        'mirrors'=>'http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=fasttrack&infra=stock',
        'expire'=>'21600 second(s) (last: Unknown)',
        'filename'=>'/etc/yum.repos.d/CentOS-fasttrack.repo'
      }, {
        'id'=>'updates/7/x86_64',
        'name'=>'CentOS-7 - Updates',
        'status'=>'enabled',
        'revision'=>'1441308326',
        'updated'=>'Thu Sep  3 19:26:40 2015',
        'pkgs'=>'1302',
        'size'=>'3.7 G',
        'mirrors'=>'http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=updates&infra=stock',
        'baseurl'=>'http://mirror.softaculous.com/centos/7.1.1503/updates/x86_64/ (9 more)',
        'expire'=>'21600 second(s) (last: Sun Sep  6 10:20:49 2015)',
        'filename'=>'/etc/yum.repos.d/CentOS-Base.repo'
      }, {
        'id'=>'updates-source/7',
        'name'=>'CentOS-7 - Updates Sources',
        'status'=>'disabled',
        'baseurl'=>'http://vault.centos.org/centos/7/updates/Source/',
        'expire'=>'21600 second(s) (last: Unknown)',
        'filename'=>'/etc/yum.repos.d/CentOS-Sources.repo' }]
      _(resource.repos.length).must_equal 22
    end

    it 'get repository details' do
      _(resource.repos).must_equal [
        'C7.0.1406-base/x86_64', 'C7.0.1406-centosplus/x86_64', 'C7.0.1406-extras/x86_64',
        'C7.0.1406-fasttrack/x86_64', 'C7.0.1406-updates/x86_64', 'base/7/x86_64',
        'base-debuginfo/x86_64', 'base-source/7', 'centosplus/7/x86_64',
        'centosplus-source/7', 'cr/7/x86_64', 'epel/x86_64', 'epel-debuginfo/x86_64',
        'epel-source/x86_64', 'epel-testing/x86_64', 'epel-testing-debuginfo/x86_64',
        'epel-testing-source/x86_64', 'extras/7/x86_64', 'extras-source/7', 'fasttrack/7/x86_64',
        'updates/7/x86_64', 'updates-source/7'
      ]
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
      extras = resource.repo('extras-source/7')
      _(extras.exist?).must_equal true
      _(extras.enabled?).must_equal false
    end

    it 'test disabled extra-source repo with short name' do
      extras = resource.repo('extras-source/7')
      _(extras.exist?).must_equal true
      _(extras.enabled?).must_equal false
    end

    it 'test missing repo' do
      extras = resource.repo('remi')
      _(extras.exist?).must_equal false
      _(extras.enabled?).must_equal false
    end

    # test serverspec syntax
    let(:serverspec) { loadResource('yumrepo', 'extras') }
    it 'test enabled extra repo (serverspec backwards comptability)' do
      _(serverspec.exists?).must_equal true
      _(serverspec.enabled?).must_equal true
    end
  end
end
