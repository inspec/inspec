# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

class OS < Inspec.resource(1)
  name 'os'
  desc 'Use the os InSpec audit resource to test the platform on which the system is running.'
  example "
    describe os[:family] do
      it { should eq 'redhat' }
    end
  "

  # reuse helper methods from backend
  %w{redhat? debian? suse? bsd? solaris? linux? unix? windows?}.each do |os_family|
    define_method((os_family).to_sym) do
      inspec.backend.os.send(os_family)
    end
  end

  def [](name)
    # convert string to symbol
    name = name.to_sym if name.is_a? String
    inspec.backend.os[name]
  end

  def to_s
    'Operating System Detection'
  end
end
