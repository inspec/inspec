module Inspec::Resources::PodmanObject
  def exist?
    object_info.exists?
  end

  def id
    object_info.ids[0] if object_info.entries.size == 1
  end
end