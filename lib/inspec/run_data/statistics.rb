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
        :failed
      ) do
        include HashLikeStruct
        def initialize(raw_stat_ctl_data)
          self.total = raw_stat_ctl_data[:total]
          self.passed = Inspec::RunData::Statistics::Controls::Total.new(raw_stat_ctl_data[:passed][:total])
          self.skipped = Inspec::RunData::Statistics::Controls::Total.new(raw_stat_ctl_data[:skipped][:total])
          self.failed = Inspec::RunData::Statistics::Controls::Total.new(raw_stat_ctl_data[:failed][:total])
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
