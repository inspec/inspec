#
# Copyright 2017, Christoph Hartmann
#

module Inspec::Resources::DockerObject
  def exist?
    object_info.exists?
  end

  def id
    object_info.ids[0] if object_info.entries.size == 1
  end

  private

  def parse_components_from_image(image_string)
    # if the user did not supply an image string, they likely supplied individual
    # option parameters, such as repo and tag. Return empty data back to the caller.
    return {} if image_string.nil?

    first_colon = image_string.index(":") || -1
    first_slash = image_string.index("/") || -1

    if image_string.count(":") == 2
      # If there are two colons in the image string, it contains a repo-with-port and a tag.
      # example: localhost:5000/chef/inspec:1.46.3
      partitioned_string = image_string.rpartition(":")
      repo = partitioned_string.first
      tag = partitioned_string.last
      image_name = repo.split("/")[1..-1].join
    elsif image_string.count(":") == 1 && first_colon < first_slash
      # If there's one colon in the image string, and it comes before a forward-slash,
      # it contains a repo-with-port but no tag.
      # example: localhost:5000/ubuntu
      repo = image_string
      tag = nil
      image_name = repo.split("/")[1..-1].join
    else
      # If there's one colon in the image string and it doesn't preceed a slash, or if
      # there is no colon at all, then it separates the repo from the tag, if there is a tag.
      # example: chef/inspec:1.46.3
      # example: chef/inspec
      # example: ubuntu:14.04
      repo, tag = image_string.split(":")
      image_name = repo
    end

    # return the repo, image_name and tag parsed from the string, which can be merged into
    # the rest of the user-supplied options
    { repo: repo, image_name: image_name, tag: tag }
  end
end
