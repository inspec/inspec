module Inspec
  class RunData
    Control = Struct.new(
      :code,            # String
      :desc,            # String
      :descriptions,    # Hash with custom keys
      :id,              # String
      :impact,          # Float
      :refs,            # Complex local
      :results,         # complex standalone
      :source_location, # Complex local
      :tags,            # Hash with custom keys
      :title,           # String
      :waiver_data      # Complex local
    ) do
      include HashLikeStruct
      def initialize(raw_ctl_data)
        self.refs = (raw_ctl_data[:refs] || []).map { |r| Inspec::RunData::Control::Ref.new(r) }
        self.results = (raw_ctl_data[:results] || []).map { |r| Inspec::RunData::Result.new(r) }
        self.source_location = Inspec::RunData::Control::SourceLocation.new(raw_ctl_data[:source_location] || {})
        self.waiver_data = Inspec::RunData::Control::WaiverData.new(raw_ctl_data[:waiver_data] || {})

        [
          :code,            # String
          :desc,            # String
          :descriptions,    # Hash with custom keys
          :id,              # String
          :impact,          # Float
          :tags,            # Hash with custom keys
          :title,           # String
        ].each do |field|
          self[field] = raw_ctl_data[field]
        end
      end
    end

    class Control
      Ref = Struct.new(
        :url, :ref
      ) do
        include HashLikeStruct
        def initialize(raw_ref_data)
          %i{url ref}.each { |f| self[f] = raw_ref_data[f] }
        end
      end

      SourceLocation = Struct.new(
        :line, :ref
      ) do
        include HashLikeStruct
        def initialize(raw_sl_data)
          %i{line ref}.each { |f| self[f] = raw_sl_data[f] }
        end
      end

      # {
      #   "expiration_date"=>#<Date: 2077-06-01 ((2479821j,0s,0n),+0s,2299161j)>,
      #   "justification"=>"Lack of imagination",
      #   "run"=>false,
      #   "skipped_due_to_waiver"=>true,
      #   "message"=>""}
      WaiverData = Struct.new(
        :expiration_date,
        :justification,
        :run,
        :skipped_due_to_waiver,
        :message
      ) do
        include HashLikeStruct
        def initialize(raw_wv_data)
          # These have string keys in the raw data!
          %i{
            expiration_date
            justification
            run
            skipped_due_to_waiver
            message
          }.each { |f| self[f] = raw_wv_data[f.to_s] }
        end
      end
    end
  end
end
