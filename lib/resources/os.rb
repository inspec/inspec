# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

class OS < Vulcano.resource(1)
  name 'os'

  # reuse helper methods from backend
  %w{redhat? debian? suse? bsd? solaris? linux? unix? windows?}.each do |os_family|
    define_method((os_family).to_sym) do
      vulcano.backend.os.send(os_family)
    end
  end

  def [](name)
    vulcano.backend.os[name]
  end

  def to_s
    'Operating System Detection'
  end
end
