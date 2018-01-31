# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Christoph Hartmann
# author: Dominik Richter

module Inspec::Resources
  class Apache < Inspec.resource(1)
    name 'apache'
    desc 'Use the apache InSpec audit resource to retrieve Apache environment settings.'
    example "
      describe apache do
        its ('service') { should cmp 'apache2' }
      end

      describe apache do
        its ('conf_dir') { should cmp '/etc/apache2' }
      end

      describe apache do
        its ('conf_path') { should cmp '/etc/apache2/apache2.conf' }
      end

      describe apache do
        its ('user') { should cmp 'www-data' }
      end
    "

    attr_reader :service, :conf_dir, :conf_path, :user
    def initialize
      warn '[DEPRECATED] The `apache` resource is deprecated and will be removed in InSpec 3.0.'

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
