# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Christoph Hartmann
# author: Dominik Richter
# license: All rights reserved

module Inspec::Resources
  class Apache < Inspec.resource(1)
    name 'apache'

    attr_reader :service, :conf_dir, :conf_path, :user
    def initialize
      if inspec.os.debian?
        @service = 'apache2'
        @conf_dir = '/etc/apache2/'
        @conf_path = File.join @conf_dir, 'apache2.conf'
        @user = 'www-data'
      else
        @service = 'httpd'
        @conf_dir = '/etc/httpd/'
        @conf_path = File.join @conf_dir, '/conf/httpd.conf'
        @user = 'apache'
      end
    end

    def to_s
      'Apache Environment'
    end
  end
end
