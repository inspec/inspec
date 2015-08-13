# encoding: utf-8

class ChefAuditTarget
  def handles?(target)
    File::directory?(target) and
      File::directory?(File.join(target, 'recipes')) and
      File::file?(File.join(target, 'metadata.rb'))
  end

  def resolve(target)
    Dir[File.join(target,'recipes','*.rb')]
  end
end

Vulcano::Targets.add_module('chef-audit', ChefAuditTarget.new)
