require 'inspec/utils/telemetry/collector'

module Inspec
  # A Global method to add a data series object to the Telemetry Collection.
  # `data_series_name`s are unique, so `:dependency_group` will always return
  # the same object.
  # `data_point` is optional, you may also supply a block with several data points.
  # All data points should allow #to_s
  def self.record_telemetry_data(data_series_name, data_point = nil)
    coll = Inspec::Telemetry::Collector.instance
    return unless coll.telemetry_enabled?
    ds = coll.find_or_create_data_series(data_series_name)
    return unless ds.enabled?

    if block_given?
      ds << yield
    else
      ds << data_point
    end
  end
end
