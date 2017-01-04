# encoding: utf-8
# frozen_string_literal: true
# check for site in IIS
# Usage:
# describe iis_site('Default Web Site') do
#   it{ should exist }
#   it{ should be_running }
#   it{ should be_in_app_pool('Default App Pool') }
#   it{ should have_path('C:\\inetpub\wwwroot\\DefaultWebSite') }
#   it{ should have_binding('https :443:www.contoso.com sslFlags=0') }
#   it{ should have_binding('net.pipe *') }
# end
#
# Note: this is only supported in windows 2012 and later

module Inspec::Resources
  class IisSite < Inspec.resource(1)
    name 'iis_site'
    desc 'Tests IIS site configuration on windows. Supported in server 2012+ only'
    example "
      describe iis_site('Default Web Site') do
        it { should exist }
        it { should be_running }
        it { should have_app_pool('DefaultAppPool') }
        it { should have_binding('https :443:www.contoso.com sslFlags=0') }
        it { should have_binding('net.pipe *') }
        it { should have_path('C:\\inetpub\\wwwroot') }
      end
    "

    def initialize(site_name)
      @site_name = site_name
      @cache = nil

      @site_provider = SiteProvider.new(inspec)

      # verify that this resource is only supported on Windows
      return skip_resource 'The `iis_site` resource is not supported on your OS.' if inspec.os[:family] != 'windows'
    end

    def app_pool
      iis_site[:app_pool]
    end

    def bindings
      iis_site[:bindings]
    end

    def state
      iis_site[:state]
    end

    def path
      iis_site[:path]
    end

    def exists?
      !iis_site.nil? && !iis_site[:name].nil?
    end

    def running?
      iis_site.nil? ? false : (iis_site[:state] == 'Started')
    end

    def has_app_pool?(app_pool)
      iis_site.nil? ? false : iis_site[:app_pool] == app_pool
    end

    def has_path?(path)
      iis_site.nil? ? false : iis_site[:path] == path
    end

    def has_binding?(binding)
      iis_site.nil? ? false : (iis_site[:bindings].include? binding)
    end

    def to_s
      "iis_site '#{@site_name}'"
    end

    def iis_site
      return @cache if !@cache.nil?
      @cache = @site_provider.iis_site(@site_name) if !@site_provider.nil?
    end
  end

  class SiteProvider
    attr_reader :inspec

    def initialize(inspec)
      @inspec = inspec
    end

    # want to populate everything using one powershell command here and spit it out as json
    def iis_site(name)
      command = "Get-Website '#{name}' | select-object -Property Name,State,PhysicalPath,bindings,ApplicationPool | ConvertTo-Json"
      cmd = @inspec.command(command)

      begin
        site = JSON.parse(cmd.stdout)
      rescue JSON::ParserError => _e
        return nil
      end

      bindings_array = site['bindings']['Collection'].map { |k, _str|
        k['protocol'] <<
          ' ' <<
          k['bindingInformation'] <<
          (k['protocol'] == 'https' ? ' sslFlags=' << flags : '')
      }

      # map our values to a hash table
      info = {
        name: site['name'],
        state: site['state'],
        path: site['physicalPath'],
        bindings: bindings_array,
        app_pool: site['applicationPool'],
      }

      info
    end
  end

  # for compatability with serverspec
  # this is deprecated syntax and will be removed in future versions
  class IisSiteServerSpec < IisSite
    name 'iis_website'
    desc 'Tests IIS site configuration on windows. Deprecated, use `iis_site` instead.'
    example "
      describe iis_website('Default Website') do
        it{ should exist }
        it{ should be_running }
        it{ should be_in_app_pool('Default App Pool') }
      end
    "

    def initialize(site_name)
      super(site_name)
      warn '[DEPRECATION] `iis_website(site_name)` is deprecated.  Please use `iis_site(site_name)` instead.'
    end

    def in_app_pool?(app_pool)
      has_app_pool?(app_pool)
    end
  end
end
