# encoding: utf-8

class ServerspecTarget
  def handles?(target)
    File::directory?(target) and
      File::directory?(File.join(target, 'spec'))
  end

  def resolve(target)
    Dir[File.join(target,'spec','**', '*_spec.rb')]
  end
end

Vulcano::Targets.add_module('serverspec', ServerspecTarget.new)
