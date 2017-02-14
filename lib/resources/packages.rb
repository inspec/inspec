# encoding: utf-8
# copyright: 2017, Chef Software, Inc. <legal@chef.io>
# author: Joshua Timberman
# author: Alex Pop
# license: All rights reserved

require 'utils/filter'

module Inspec::Resources
  class Packages < Inspec.resource(1)
    name 'packages'
    desc 'Use the packages InSpec audit resource to test properties for multiple packages installed on the system'
    example "
      describe packages(/xserver-xorg.*/) do
        its('entries') { should be_empty }
      end
      describe packages('vim').entries.length do
        it { should be > 1 }
      end
      describe packages(/vi.+/).where { status != 'installed' } do
        its('statuses') { should be_empty }
      end
    "

    def initialize(pattern)
      os = inspec.os
      if os.debian?
        @pkgs = Debs.new(inspec)
      elsif os.redhat? || %w{suse amazon fedora}.include?(os[:family])
        @pkgs = Rpms.new(inspec)
      else
        return skip_resource "The packages resource is not yet supported on OS #{inspec.os.name}"
      end

      @pattern = pattern_regexp(pattern)
      all_pkgs = @pkgs.build_package_list
      @list = all_pkgs.find_all do |hm|
        hm[:name] =~ @pattern
      end
    end

    def to_s
      "Packages #{@pattern.class == String ? @pattern : @pattern.inspect}"
    end

    filter = FilterTable.create
    filter.add_accessor(:where)
          .add_accessor(:entries)
          .add(:statuses,  field: 'status', style: :simple)
          .add(:names,     field: 'name')
          .add(:versions,  field: 'version')
          .connect(self, :filtered_packages)

    private

    def pattern_regexp(p)
      if p.class == String
        Regexp.new(Regexp.escape(p))
      elsif p.class == Regexp
        p
      else
        raise 'Invalid name argument to packages resource, please use a "string" or /regexp/'
      end
    end

    def filtered_packages
      warn "The packages resource is not yet supported on OS #{inspec.os.name}" if resource_skipped
      @list
    end
  end

  class PkgsManagement
    PackageStruct = Struct.new(:status, :name, :version)
    attr_reader :inspec
    def initialize(inspec)
      @inspec = inspec
    end
  end

  # Debian / Ubuntu
  class Debs < PkgsManagement
    def build_package_list
      # use two spaces as delimiter in case any of the fields has a space in it
      command = "dpkg-query -W -f='${db:Status-Abbrev}  ${Package}  ${Version}\\n'"
      cmd = inspec.command(command)
      all = cmd.stdout.split("\n")
      return [] if all.nil?
      all.map do |m|
        a = m.split(/ {2,}/)
        a[0] = 'installed' if a[0] =~ /^.i/
        a[2] = a[2].split(':').last
        PackageStruct.new(*a)
      end
    end
  end

  # RedHat family
  class Rpms < PkgsManagement
    def build_package_list
      # use two spaces as delimiter in case any of the fields has a space in it
      command = "rpm -qa --queryformat '%{NAME}  %{VERSION}-%{RELEASE}\\n'"
      cmd = inspec.command(command)
      all = cmd.stdout.split("\n")
      return [] if all.nil?
      all.map do |m|
        a = m.split('  ')
        a.unshift('installed')
        PackageStruct.new(*a)
      end
    end
  end
end
