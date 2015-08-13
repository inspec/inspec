# encoding: utf-8

class FileTarget
  def handles?(target)
    File::file?(target)
  end

  def resolve(target)
    target
  end
end

Vulcano::Targets.add_module(FileTarget.new)
