require 'inspec/utils/telemetry'

module Inspec
  def self.telemetry_report(report)
    collector = Inspec::Telemetry::Collector.instance
    collector.report_add(report)
  end
end
