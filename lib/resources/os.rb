# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

class OS < Inspec.resource(1)
  name 'os'

  # reuse helper methods from backend
  %w{redhat? debian? suse? bsd? solaris? linux? unix? windows?}.each do |os_family|
    define_method((os_family).to_sym) do
      inspec.backend.os.send(os_family)
    end
  end

  def [](name)
    inspec.backend.os[name]
  end

  def to_s
    'Operating System Detection'
  end
end
