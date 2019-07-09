# frozen_string_literal: true
# check for web applications in IIS
# Note: this is only supported in windows 2012 and later
module Inspec::Resources
  class IisApp < Inspec.resource(1)
    name "iis_app"
    supports platform: "windows"
    desc "Tests IIS application configuration on windows. Supported in server 2012+ only"
    example <<~EXAMPLE
      describe iis_app('/myapp', 'Default Web Site') do
        it { should exist }
        it { should have_application_pool('MyAppPool') }
        it { should have_protocols('http') }
        it { should have_site_name('Default Web Site') }
        it { should have_physical_path('C:\\inetpub\\wwwroot\\myapp') }
        it { should have_path('\\My Application') }
      end
    EXAMPLE

    def initialize(path, site_name)
      @path = path
      @site_name = site_name
      @cache = nil
      @inspec = inspec
    end

    def application_pool
      iis_app[:application_pool]
    end

    def protocols
      iis_app[:protocols]
    end

    def site_name
      iis_app[:site_name]
    end

    def path
      iis_app[:path]
    end

    def physical_path
      iis_app[:physical_path]
    end

    def exists?
      !iis_app[:path].empty?
    end

    def has_site_name?(site_name)
      iis_app[:site_name] == site_name
    end

    def has_application_pool?(application_pool)
      iis_app[:application_pool] == application_pool
    end

    def has_path?(path)
      iis_app[:path] == path
    end

    def has_physical_path?(physical_path)
      iis_app[:physical_path] == physical_path
    end

    def has_protocol?(protocol)
      iis_app[:protocols].include?(protocol)
    end

    def to_s
      "iis_app '#{@site_name}#{@path}'"
    end

    private

    def iis_app
      return @cache unless @cache.nil?

      command = "Import-Module WebAdministration; Get-WebApplication -Name '#{@path}' -Site '#{@site_name}' | Select-Object * | ConvertTo-Json"
      cmd = @inspec.command(command)

      begin
        app = JSON.parse(cmd.stdout)
      rescue JSON::ParserError => _e
        return {}
      end

      # map our values to a hash table
      info = {
        site_name: @site_name,
        path: @path,
        application_pool: app["applicationPool"],
        physical_path: app["PhysicalPath"],
        protocols: app["enabledProtocols"],
      }

      @cache = info unless info.nil?
    end
  end
end
