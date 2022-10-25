require "inspec/resources/zfs_pool"

module Inspec::Resources
  class Zfs < ZfsPool
    # resource's internal name.
    name "zfs"

    # Restrict to only run on the below platforms
    supports platform: "unix"

    desc "Use the zfs InSpec audit resource to test if the named ZFS Pool is present and/or has certain properties."

    example <<~EXAMPLE
      describe zfs("new-pool") do
        it { should exist }
        it { should have_property({ "failmode" => "wait", "capacity" => "0" }) }
      end
    EXAMPLE

    # Resource initialization is done in the parent class i.e. ZfsPool

    # Unique identity for the resource.
    def resource_id
      # @zfs_pool is the zfs pool name assigned during initialization in the parent class i.e. ZfsPool
      @zfs_pool
    end

    # Resource appearance in test reports.
    def to_s
      "zfs #{resource_id}"
    end

    # The below matcher checks if the given properties are valid properties of the zfs pool.
    def has_property?(properties_hash)
      raise Inspec::Exceptions::ResourceSkipped, "Provide a valid key-value pair of the zfs properties." if properties_hash.empty?

      # Transform all the key & values provided by user to string,
      # since hash keys can be symbols or strings & values can be integers or strings.
      # @params is a hash populated in the parent class with the properties(key-value) of the current zfs pool.
      # and the key-value in @params are of string type.
      properties_hash.transform_keys(&:to_s)
      properties_hash.transform_values(&:to_s)

      # check if the given properties is a subset of @params
      properties_hash <= @params
    end
  end
end
