# frozen_string_literal: true

require "inspec/resources/command"

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
    name "iis_site"
    supports platform: "windows"
    desc "Tests IIS site configuration on windows. Supported in server 2012+ only"
    example <<~EXAMPLE
      describe iis_site('Default Web Site') do
        it { should exist }
        it { should be_running }
        it { should have_app_pool('DefaultAppPool') }
        it { should have_binding('https :443:www.contoso.com sslFlags=0') }
        it { should have_binding('net.pipe *') }
        it { should have_path('C:\\inetpub\\wwwroot') }
      end
    EXAMPLE

    def initialize(site_name)
      @site_name = site_name
      @cache = nil

      @site_provider = SiteProvider.new(inspec)

      # verify that this resource is only supported on Windows
      return skip_resource "The `iis_site` resource is not supported on your OS." if inspec.os[:family] != "windows"
    end

    def app_pool
      iis_site.nil? ? nil : iis_site[:app_pool]
    end

    def bindings
      iis_site.nil? ? nil : iis_site[:bindings]
    end

    def state
      iis_site.nil? ? nil : iis_site[:state]
    end

    def path
      iis_site.nil? ? nil : iis_site[:path]
    end

    def exists?
      !iis_site.nil? && !iis_site[:name].nil?
    end

    def running?
      iis_site.nil? ? false : (iis_site[:state] == "Started")
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

    def resource_id
      @site_name || "IIS Site"
    end

    def to_s
      "iis_site '#{@site_name}'"
    end

    def iis_site
      return @cache unless @cache.nil?

      @cache = @site_provider.iis_site(@site_name) unless @site_provider.nil?
    end
  end

  class SiteProvider
    attr_reader :inspec

    def initialize(inspec)
      @inspec = inspec
    end

    # want to populate everything using one powershell command here and spit it out as json
    def iis_site(name)
      command = "Get-Website '#{name}' | Select-Object -Property Name,State,PhysicalPath,bindings,ApplicationPool | ConvertTo-Json"
      cmd = @inspec.command(command)

      begin
        site = JSON.parse(cmd.stdout)
      rescue JSON::ParserError => _e
        return nil
      end

      bindings_array = site["bindings"]["Collection"].map do |k|
        "#{k["protocol"]} #{k["bindingInformation"]}#{k["protocol"] == "https" ? " sslFlags=#{k["sslFlags"]}" : ""}"
      end

      # map our values to a hash table
      info = {
        name: site["name"],
        state: site["state"],
        path: site["physicalPath"],
        bindings: bindings_array,
        app_pool: site["applicationPool"],
      }

      info
    end
  end

  # for compatability with serverspec
  # this is deprecated syntax and will be removed in future versions
  class IisSiteServerSpec < IisSite
    name "iis_website"
    desc "Tests IIS site configuration on windows. Deprecated, use `iis_site` instead."
    example <<~EXAMPLE
      describe iis_website('Default Website') do
        it{ should exist }
        it{ should be_running }
        it{ should be_in_app_pool('Default App Pool') }
      end
    EXAMPLE

    def initialize(site_name)
      Inspec.deprecate(:resource_iis_website, "The `iis_website` resource is deprecated. Please use `iis_site` instead.")
      super(site_name)
    end

    def in_app_pool?(app_pool)
      has_app_pool?(app_pool)
    end
  end
end
