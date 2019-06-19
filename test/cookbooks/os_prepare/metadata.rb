name "os_prepare"
maintainer "Chef Software, Inc."
maintainer_email "support@chef.io"
description "This cookbook prepares the test operating systems"
version "1.0.0"

# this cookbook has changed rapidly in the past so we pin it here to prevent build failures
depends "postgresql", "= 7.1.3"

depends "runit"
depends "ssh-hardening"
depends "docker"
