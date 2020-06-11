#!/bin/sh
#
# bootstrap.sh file for test-kitchen shell provisioner to run tests on 
# remote server.
#

set -e
set -x

machine=`uname -m`
os=`uname -s`

if test -f "/etc/lsb-release" && grep -q DISTRIB_ID /etc/lsb-release; then
  platform=`grep DISTRIB_ID /etc/lsb-release | cut -d "=" -f 2 | tr '[A-Z]' '[a-z]'`
  platform_version=`grep DISTRIB_RELEASE /etc/lsb-release | cut -d "=" -f 2`
fi

if test "x$os" = "xFreeBSD"; then
  platform="freebsd"
  platform_version=`uname -r | sed 's/-.*//'`
fi

compile_rubygems() {
  cd /tmp
  wget http://production.cf.rubygems.org/rubygems/rubygems-1.6.2.tgz -O - | tar zxf -
  cd rubygems-1.6.2 && ruby setup.rb --no-format-executable
  # i think this assumes running under bash
  cd -
}


case $platform in
  "ubuntu")
    export DEBIAN_FRONTEND=noninteractive
    apt-get update
    apt-get -y -y install bc
    ubuntu_before_12_04=`echo "$platform_version < 12.04" | bc`
    ubuntu_before_14_04=`echo "$platform_version < 14.04" | bc`
    if [ "x$ubuntu_before_12_04" = "x1" ]; then
      apt-get -q -y install ruby1.8 ruby1.8-dev rubygems1.8 libopenssl-ruby1.8
      apt-get -q -y install git-core cmake build-essential wget
      update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby1.8 500
      update-alternatives --install /usr/bin/gem gem /usr/bin/gem1.8 500
      update-alternatives --config ruby
      update-alternatives --config gem
      compile_rubygems
    elif [ "x$ubuntu_before_14_04" = "x1" ]; then
      apt-get -q -y purge ruby1.8 ruby1.8-dev rubygems1.8 libopenssl-ruby1.8
      apt-get -q -y install ruby1.9.1 ruby1.9.1-dev rubygems1.9.1 libopenssl-ruby1.9.1
      apt-get -q -y install git cmake build-essential
      update-alternatives --config ruby
      update-alternatives --config gem
    else
      apt-get -q -y purge ruby1.8
      apt-get -q -y install ruby1.9.1 ruby1.9.1-dev rubygems1.9.1 libopenssl-ruby1.9.1
      apt-get -q -y install git cmake build-essential
    fi
    ;;
  freebsd)
    if pkg -N 2>&1 | grep "pkg is not installed"; then
      export ASSUME_ALWAYS_YES=YES
      pkg bootstrap
      pkg2ng
    fi
    pkg install -y ruby
    pkg install -y ruby19-gems
    ;;
  *)
    echo "i don't know how to setup base o/s on platform $platform, hope it works!"
    ;;
esac

gem install bundler --no-rdoc --no-ri

cd /tmp/kitchen/data
bundle install --without development_extras
rake compile
rake spec
