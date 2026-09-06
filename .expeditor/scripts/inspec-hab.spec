# Disable any shell actions, replace them with simply 'true'
%define __spec_prep_post true
%define __spec_prep_pre true
%define __spec_build_post true
%define __spec_build_pre true
%define __spec_install_post true
%define __spec_install_pre true
%define __spec_clean_post true
%define __spec_clean_pre true

# Use SHA256 checksums for all files
%define _binary_filedigest_algorithm 8

%define _binary_payload w1.xzdio

# Disable creation of build-id links
%define _build_id_links none

# Metadata
Name: inspec
Version: %{VERSION}
Release: 1%{?dist}
Summary:  The full stack of inspec
AutoReqProv: no
BuildRoot: %buildroot
Prefix: /
Group: default
License: Chef EULA
Vendor: Omnibus <omnibus@getchef.com>
URL: https://www.chef.io
Packager: Chef Software, Inc. <maintainers@chef.io>
%description
The full stack of inspec

%prep
# noop

%build
# noop

%install
# noop

%clean
# noop

%pre
#!/bin/sh
#
# Perform necessary inspec setup steps
# before package is installed.
#

echo "You're about to install InSpec!"

%post
#!/bin/sh
#
# Perform necessary inspec setup steps
# after package is installed.
#

# Create wrapper binaries into /hab/chef directory
mkdir -p /hab/inspec/bin

binaries=("inspec")
for binary in "${binaries[@]}"; do
  cat << EOF > /hab/inspec/bin/$binary
#!/bin/sh
hab pkg exec chef/inspec $binary -- "\$@"
EOF
  chmod +x /hab/inspec/bin/$binary
done

PROGNAME=`basename $0`
INSTALLER_DIR=/hab/inspec
CONFIG_DIR=/etc/inspec
USAGE="usage: $0"

error_exit()
{
  echo "${PROGNAME}: ${1:-"Unknown Error"}" 1>&2
  exit 1
}

is_darwin()
{
  uname -a | grep "^Darwin" 2>&1 >/dev/null
}

if is_darwin; then
    PREFIX="/usr/local"
    mkdir -p "$PREFIX/bin"
else
    PREFIX="/usr"
fi

binaries="inspec"
for binary in $binaries; do
  rm -f $PREFIX/bin/$binary
done

for binary in $binaries; do
  ln -sf $INSTALLER_DIR/bin/$binary $PREFIX/bin || error_exit "Cannot link $binary to $PREFIX/bin"
done

# Ensure all files/directories in $INSTALLER_DIR are owned by root. This
# has been fixed on new installs but upgrades from old installs need to
# be manually fixed.
chown -Rh 0:0 $INSTALLER_DIR

echo "Thank you for installing Chef InSpec!"

exit 0

%preun
#!/bin/sh
#
# Perform necessary inspec setup steps
# prior to installing package.
#

PROGNAME=`basename $0`

error_exit()
{
  echo "${PROGNAME}: ${1:-"Unknown Error"}" 1>&2
  exit 1
}

exit 0

%postun
#!/bin/sh
#
# Perform necessary inspec removal steps
# after package is uninstalled.
#

is_darwin()
{
  uname -a | grep "^Darwin" 2>&1 >/dev/null
}

if is_darwin; then
    PREFIX="/usr/local"
else
    PREFIX="/usr"
fi

cleanup_symlinks() {
  binaries="inspec"
  for binary in $binaries; do
    rm -f $PREFIX/bin/$binary
  done
}

# Clean up binary symlinks if they exist
# see: http://tickets.opscode.com/browse/CHEF-3022
if [ ! -f /etc/redhat-release -a ! -f /etc/fedora-release -a ! -f /etc/system-release ]; then
  # not a redhat-ish RPM-based system
  cleanup_symlinks
elif [ "x$1" = "x0" ]; then
  # RPM-based system and we're deinstalling rather than upgrading
  cleanup_symlinks
fi

# Clean the /hab/inspec directory created with wrappers
rm -rf /hab/inspec || true

# Remove /hab if it is empty after this RPM is uninstalled
if [ -d /hab ] && [ -z "$(ls -A /hab)" ]; then
  rmdir /hab
fi

echo "Chef InSpec has been uninstalled!"

exit 0


%files
%defattr(-,root,root,-)
%dir %attr(0755,root,root) /hab
