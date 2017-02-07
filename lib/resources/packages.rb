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
      @pattern = pattern_regexp(pattern)
      all_pkgs = package_list
      @list = all_pkgs.find_all do |hm|
        hm[:name] =~ pattern_regexp(pattern)
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
        fail 'invalid name argument to packages resource, please use a "string" or /regexp/'
      end
    end

    def filtered_packages
      @list
    end

    def package_list
      os = inspec.os

      if os.debian?
        command = "dpkg-query -W -f='${db:Status-Abbrev} ${Package} ${Version}\\n'"
      else
        fail "packages resource is not yet supported on #{os.name}"
      end
      build_package_list(command)
    end

    Package = Struct.new(:status, :name, :version)

    def build_package_list(command)
      cmd = inspec.command(command)
      all = cmd.stdout.split("\n")[1..-1]
      return [] if all.nil?
      all.map do |m|
        a = m.split
        a[0] = 'installed' if a[0] =~ /^.i/
        a[2] = a[2].split(':').last
        Package.new(*a)
      end
    end
  end
end
