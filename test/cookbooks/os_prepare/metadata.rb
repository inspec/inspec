# encoding: utf-8
name 'os_prepare'
maintainer 'Chef Software, Inc.'
maintainer_email 'support@chef.io'
description 'This cookbook prepares the test operating systems'
version '1.0.0'

depends 'apt'
depends 'yum'
depends 'runit'
depends 'postgresql'
depends 'httpd', '~> 0.2'
