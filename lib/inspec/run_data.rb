
module Inspec
  module HashLikeStruct
    # Only list keys whose value are non-nil
    def keys
      members.reject { |k| self[k].nil? }
    end

    # Only list non-nil members for backwards compatibility
    def key?(item)
      members.include?(item) && non_nil?(item)
    end

    # This is provided for clarity - many locations make this test
    def non_nil?(item)
      !self[item].nil?
    end
  end

  RunData = Struct.new(
    :controls,     # Array of Inspec::RunData::Control (flattened)
    :other_checks,
    :profiles,     # Array of Inspec::RunData::Profile
    :platform,     # Inspec::RunData::Platform
    :statistics,   # Inspec::RunData::Statistics
    :version       # String
  ) do
    include HashLikeStruct
    def initialize(raw_run_data)
      self.controls   = raw_run_data[:controls].map { |c| Inspec::RunData::Control.new(c) }
      self.profiles   = raw_run_data[:profiles].map { |p| Inspec::RunData::Profile.new(p) }
      self.statistics = Inspec::RunData::Statistics.new(raw_run_data[:statistics])
      self.platform   = Inspec::RunData::Platform.new(raw_run_data[:platform])
      self.version    = raw_run_data[:version]
    end
  end

  class RunData

    # This is the data layout version of RunData.
    # We plan to follow a data-oriented version of semver:
    #  patch: fixing a bug in the provenance or description of a data element, no key changes
    #  minor: adding new data elements
    #  major: deleting or renaming data elements
    # Less than major version 1.0.0, the API is considered unstable.
    # The current plan is to bump the major version to 1.0.0 when all of the existing
    # core reporters have been migrated to plugins. It is probable that new data elements
    # and new Hash compatibility behavior will be added during the core reporter plugin
    # conversion process.
    SCHEMA_VERSION = "0.2.0".freeze

    def self.compatible_schema?(constraints)
      reqs = Gem::Requirement.create(constraints)
      reqs.satisfied_by?(Gem::Version.new(SCHEMA_VERSION))
    end

    Platform = Struct.new(
      :name, :release, :target
    ) do
      include HashLikeStruct
      def initialize(raw_plat_data)
        %i{name release target}.each { |f| self[f] = raw_plat_data[f] || "" }
      end
    end
  end
end

require_relative "run_data/result"
require_relative "run_data/control"
require_relative "run_data/profile"
require_relative "run_data/statistics"
