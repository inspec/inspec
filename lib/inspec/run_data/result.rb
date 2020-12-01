module Inspec
  class RunData
    Result = Struct.new(
      :message,             # Human-friendly test failure message
      :code_desc,           # Generated test description
      :expectation_message, # a substring of code_desc
      :resource_name,       # We try to determine this
      :run_time,            # Float seconds execution time
      :skip_message,        # String
      :start_time,          # DateTime
      :resource_params,     # What is passed to the resource as a raw grep
      :status, # String
      :resource_title, # Ugly internals
      # :waiver_data,       # Undocumented tramp data / not exposed in this API
      :resource, # Undocumented, what is this
      :exception,
      :backtrace
    ) do
      include HashLikeStruct
      def initialize(raw_res_data)
        [
          :status,              # String
          :code_desc,           # Generated test description
          :expectation_message, # a substring of code_desc
          :skip_message,        # String
          :run_time,
          :start_time,
          :resource_title,
          :resource,
          :exception,
          :backtrace,
          :message,
        ].each do |field|
          self[field] = raw_res_data[field]
        end

        self.resource_name = raw_res_data[:resource_title].instance_variable_get(:@__resource_name__)&.to_s
        self.resource_params = raw_res_data[:resource_title].instance_variable_get(:@grep)&.to_s
      end
    end
  end
end
