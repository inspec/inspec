module Inspec
  class RunData
    # {:duration=>0.018407, :controls=>{:total=>3, :passed=>{:total=>3}, :skipped=>{:total=>0}, :failed=>{:total=>0}}}
    Statistics = Struct.new(
      :duration,
      :controls
    ) do
      include HashLikeStruct
      def initialize(raw_stat_data)
        self.controls = Inspec::RunData::Statistics::Controls.new(raw_stat_data[:controls])
        self.duration = raw_stat_data[:duration]
      end
    end
    class Statistics
      Controls = Struct.new(
        :total,
        :passed,
        :skipped,
        :failed,
        :not_reviewed,
        :not_applicable,
        :error
      ) do
        include HashLikeStruct
        def initialize(raw_stat_ctl_data)
          self.total = raw_stat_ctl_data[:total]
          self.passed = Inspec::RunData::Statistics::Controls::Total.new(raw_stat_ctl_data[:passed][:total])
          self.failed = Inspec::RunData::Statistics::Controls::Total.new(raw_stat_ctl_data[:failed][:total])
          self.skipped = Inspec::RunData::Statistics::Controls::Total.new(raw_stat_ctl_data[:skipped][:total]) if raw_stat_ctl_data[:skipped]
          self.not_reviewed = Inspec::RunData::Statistics::Controls::Total.new(raw_stat_ctl_data[:not_reviewed][:total]) if raw_stat_ctl_data[:not_reviewed]
          self.not_applicable = Inspec::RunData::Statistics::Controls::Total.new(raw_stat_ctl_data[:not_applicable][:total]) if raw_stat_ctl_data[:not_applicable]
          self.error = Inspec::RunData::Statistics::Controls::Total.new(raw_stat_ctl_data[:error][:total]) if raw_stat_ctl_data[:error]
        end
      end
      class Controls
        Total = Struct.new(:total) do
          include HashLikeStruct
        end
      end
    end
  end
end
