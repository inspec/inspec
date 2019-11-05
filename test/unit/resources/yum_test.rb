require "helper"
require "inspec/resource"
require "inspec/resources/yum"

describe "Inspec::Resources::YumRepo" do
  let(:centos7) do
    quick_resource("yum", :centos7) do |cmd|
      stdout_file "./test/unit/mock/cmd/yum-centos7-repolist-all"
    end
  end

  let(:centos8) do
    quick_resource("yum", :centos8) do |cmd|
      stdout_file "./test/unit/mock/cmd/yum-centos8-repolist-all"
    end
  end

  it "get repository details centos7" do
    resource = centos7
    _(resource.repositories).must_equal [{
      "id" => "base/7/x86_64",
      "name" => "CentOS-7 - Base",
      "status" => "enabled",
      "revision" => "1427842153",
      "updated" => "Tue Mar 31 22:50:46 2015",
      "pkgs" => "8652",
      "size" => "6.3 G",
      "mirrors" => "http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=os&infra=stock",
      "baseurl" => "http://ftp.hosteurope.de/mirror/centos.org/7.1.1503/os/x86_64/ (9 more)",
      "expire" => "21600 second(s) (last: Sun Sep  6 10:20:46 2015)",
      "filename" => "/etc/yum.repos.d/CentOS-Base.repo",
    }, {
      "id" => "base-debuginfo/x86_64",
      "name" => "CentOS-7 - Debuginfo",
      "status" => "disabled",
      "baseurl" => "http://debuginfo.centos.org/7/x86_64/",
      "expire" => "21600 second(s) (last: Unknown)",
      "filename" => "/etc/yum.repos.d/CentOS-Debuginfo.repo",
    }, {
      "id" => "extras/7/x86_64",
      "name" => "CentOS-7 - Extras",
      "status" => "enabled",
      "revision" => "1441314199",
      "updated" => "Thu Sep  3 21:03:33 2015",
      "pkgs" => "181",
      "size" => "742 M",
      "mirrors" => "http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=extras&infra=stock",
      "baseurl" => "http://mirror.informatik.hs-fulda.de/centos7.1.1503/extras/x86_64/ (9 more)",
      "expire" => "21600 second(s) (last: Sun Sep  6 10:20:48 2015)",
      "filename" => "/etc/yum.repos.d/CentOS-Base.repo",
    }]
    _(resource.repos.length).must_equal 3
    # get repository details
    _(resource.repos).must_equal %w{base/7/x86_64 base-debuginfo/x86_64 extras/7/x86_64}
    # test its syntax repo
    _(resource.extras.exist?).must_equal true
    _(resource.extras.enabled?).must_equal true
    # test enabled extra repo
    extras = resource.repo("extras/7/x86_64")
    _(extras.exist?).must_equal true
    _(extras.enabled?).must_equal true
    _(extras.baseurl).must_include "informatik"
    # test enabled extra repo with short name
    extras = resource.repo("extras")
    _(extras.exist?).must_equal true
    _(extras.enabled?).must_equal true
    _(extras.baseurl).must_include "informatik"
    # test disabled extra-source repo
    extras = resource.repo("base-debuginfo/x86_64")
    _(extras.exist?).must_equal true
    _(extras.enabled?).must_equal false
    _(extras.to_s).must_equal "YumRepo base-debuginfo/x86_64"
  end

  it "provides methods for retrieving per-repo information" do
    resource = centos7
    repo = resource.repo("base/7/x86_64")
    _(repo.baseurl).must_equal "http://ftp.hosteurope.de/mirror/centos.org/7.1.1503/os/x86_64/ (9 more)"
    _(repo.expire).must_equal "21600 second(s) (last: Sun Sep  6 10:20:46 2015)"
    _(repo.filename).must_equal "/etc/yum.repos.d/CentOS-Base.repo"
    _(repo.mirrors).must_equal "http://mirrorlist.centos.org/?release=7&arch=x86_64&repo=os&infra=stock"
    _(repo.pkgs).must_equal "8652"
    _(repo.size).must_equal "6.3 G"
    _(repo.status).must_equal "enabled"
    _(repo.updated).must_equal "Tue Mar 31 22:50:46 2015"
  end
  it "get repository details centos8" do
    resource = centos8
    _(resource.repositories).must_equal [{
      "id" => "AppStream",
      "name" => "CentOS-8 - AppStream",
      "status" => "enabled",
      "revision" => "1569018193",
      "updated" => "Fri 20 Sep 2019 10:23:13 PM UTC",
      "pkgs" => "4,928",
      "size" => "7.1 G",
      "mirrors" => "http://mirrorlist.centos.org/?release=8&arch=x86_64&repo=AppStream&infra=stock",
      "baseurl" => "http://mirror.web-ster.com/centos/8.0.1905/AppStream/x86_64/os/ (9 more)",
      "expire" => "172,800 second(s) (last: Mon 07 Oct 2019 11:55:14 PM UTC)",
      "filename" => "/etc/yum.repos.d/CentOS-AppStream.repo",
    }, {
      "id" => "BaseOS",
      "name" => "CentOS-8 - Base",
      "status" => "enabled",
      "revision" => "1569017143",
      "updated" => "Fri 20 Sep 2019 10:05:43 PM UTC",
      "pkgs" => "2,713",
      "size" => "3.2 G",
      "mirrors" => "http://mirrorlist.centos.org/?release=8&arch=x86_64&repo=BaseOS&infra=stock",
      "baseurl" => "http://mirror.web-ster.com/centos/8.0.1905/BaseOS/x86_64/os/ (9 more)",
      "expire" => "172,800 second(s) (last: Mon 07 Oct 2019 11:55:16 PM UTC)",
      "filename" => "/etc/yum.repos.d/CentOS-Base.repo",
    }, {
      "id" => "base-debuginfo",
      "name" => "CentOS-8 - Debuginfo",
      "status" => "disabled",
      "baseurl" => "http://debuginfo.centos.org/8/x86_64/",
      "expire" => "172,800 second(s) (last: unknown)",
      "filename" => "/etc/yum.repos.d/CentOS-Debuginfo.repo",
    }, {
      "id" => "extras",
      "name" => "CentOS-8 - Extras",
      "status" => "enabled",
      "revision" => "1569074223",
      "updated" => "Sat 21 Sep 2019 01:57:03 PM UTC",
      "pkgs" => "3",
      "size" => "46 k",
      "mirrors" => "http://mirrorlist.centos.org/?release=8&arch=x86_64&repo=extras&infra=stock",
      "baseurl" => "http://mirror.web-ster.com/centos/8.0.1905/extras/x86_64/os/ (9 more)",
      "expire" => "172,800 second(s) (last: Mon 07 Oct 2019 11:55:21 PM UTC)",
      "filename" => "/etc/yum.repos.d/CentOS-Extras.repo",
    }]
    _(resource.repos.length).must_equal 4
    # get repository details
    _(resource.repos).must_equal %w{AppStream BaseOS base-debuginfo extras}
    # test its syntax repo
    _(resource.extras.exist?).must_equal true
    _(resource.extras.enabled?).must_equal true
    # test enabled extra repo
    extras = resource.repo("extras")
    _(extras.exist?).must_equal true
    _(extras.enabled?).must_equal true
    _(extras.baseurl).must_include "web-ster"
    # test enabled extra repo with short name
    extras = resource.repo("extras")
    _(extras.exist?).must_equal true
    _(extras.enabled?).must_equal true
    _(extras.baseurl).must_include "web-ster"
    # test disabled extra-source repo
    extras = resource.repo("base-debuginfo")
    _(extras.exist?).must_equal true
    _(extras.enabled?).must_equal false
    _(extras.to_s).must_equal "YumRepo base-debuginfo"
  end

  it "provides methods for retrieving per-repo information on >= el8" do
    resource = centos8
    repo = resource.repo("BaseOS")
    _(repo.baseurl).must_equal "http://mirror.web-ster.com/centos/8.0.1905/BaseOS/x86_64/os/ (9 more)"
    _(repo.expire).must_equal "172,800 second(s) (last: Mon 07 Oct 2019 11:55:16 PM UTC)"
    _(repo.filename).must_equal "/etc/yum.repos.d/CentOS-Base.repo"
    _(repo.mirrors).must_equal "http://mirrorlist.centos.org/?release=8&arch=x86_64&repo=BaseOS&infra=stock"
    _(repo.pkgs).must_equal "2,713"
    _(repo.size).must_equal "3.2 G"
    _(repo.status).must_equal "enabled"
    _(repo.updated).must_equal "Fri 20 Sep 2019 10:05:43 PM UTC"
  end
end
