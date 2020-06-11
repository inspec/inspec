# This class allows image-based tasks to be created.
class Docker::ImageTask < Rake::Task
  def self.scope_name(_scope, task_name)
    task_name
  end

  def needed?
    !has_repo_tag?
  end

  private

  def has_repo_tag?
    images.any? { |image| image.info['RepoTags'].include?(repo_tag) }
  end

  def images
    @images ||= Docker::Image.all(:all => true)
  end

  def repo
    name.split(':')[0]
  end

  def tag
    name.split(':')[1] || 'latest'
  end

  def repo_tag
    "#{repo}:#{tag}"
  end
end

# Monkeypatch Rake to add the `image` task.
module Rake::DSL
  def image(*args, &block)
    Docker::ImageTask.define_task(*args, &block)
  end
end
