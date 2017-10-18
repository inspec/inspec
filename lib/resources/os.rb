# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

module Inspec::Resources
  class OSResource < Inspec.resource(1)
    name 'os'
    desc 'Use the os InSpec audit resource to test the platform on which the system is running.'
    example "
      describe os[:family] do
        it { should eq 'redhat' }
      end

      describe os.redhat? do
        it { should eq true }
      end

      describe os.linux? do
        it { should eq true }
      end
    "

    # reuse helper methods from backend
    %w{aix? redhat? debian? suse? bsd? solaris? linux? unix? windows? hpux? darwin?}.each do |os_family|
      define_method(os_family.to_sym) do
        inspec.backend.os.send(os_family)
      end
    end

    def [](name)
      # convert string to symbol
      name = name.to_sym if name.is_a? String
      inspec.backend.os[name]
    end

    # add helper methods for easy access of properties
    # allows users to use os.name, os.family, os.release, os.arch
    %w{name family release arch}.each do |property|
      define_method(property.to_sym) do
        inspec.backend.os[property.to_sym]
      end
    end

    # helper to collect a hash object easily
    def params
      {
        name: inspec.backend.os[:name],
        family: inspec.backend.os[:family],
        release: inspec.backend.os[:release],
        arch: inspec.backend.os[:arch],
      }
    end

    def to_s
      'Operating System Detection'
    end

    # Windows release numbers from https://en.wikipedia.org/wiki/Ver_(command)
    # 6.0.6001 6.0.6002
    def windows_server_2008?
      return true if release =~ /6.0.600/
      false
    end

    # 6.1.7600 6.1.7600.16385 6.1.7601
    def windows_7?
      return true if release =~ /6.1.760/
      false
    end

    # 6.1.7600 6.1.7600.16385 6.1.7601
    def windows_server_2008_r2?
      windows_7?
    end

    # 6.2.9200 6.2.9200.16384
    def windows_8?
      return true if release =~ /6.2.9200/
      false
    end

    # 6.2.9200
    def windows_server_2012?
      return true if release =~ /6.2.9200/
      false
    end

    # 6.3.9600
    def windows_8_1?
      return true if release =~ /6.3.9600/
      false
    end

    # 6.3.9600
    def windows_server_2012_r2?
      windows_8_1?
    end

    # 10.0.10240 10.0.10586 10.0.14393 10.0.14915 10.0.15063 10.0.16241
    def windows_10?
      return true if release =~ /10.0/
      false
    end

    # 10.0.14393
    def windows_server_2016?
      return true if release =~ /10.0.14393/
      false
    end
  end
end
