# copyright: 2015, Vulcano Security GmbH

module Inspec::Resources
  class Apache < Inspec.resource(1)
    name "apache"
    supports platform: "unix"
    desc "Use the apache InSpec audit resource to retrieve Apache environment settings."
    example <<~EXAMPLE
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
    EXAMPLE

    attr_reader :service, :conf_dir, :conf_path, :user
    def initialize
      Inspec.deprecate(:resource_apache, "The apache resource is deprecated")

      if inspec.os.debian?
        @service = "apache2"
        @conf_dir = "/etc/apache2/"
        @conf_path = File.join @conf_dir, "apache2.conf"
        @user = "www-data"
      else
        @service = "httpd"
        @conf_dir = "/etc/httpd/"
        @conf_path = File.join @conf_dir, "/conf/httpd.conf"
        @user = "apache"
      end
    end

    def to_s
      "Apache Environment"
    end
  end
end
