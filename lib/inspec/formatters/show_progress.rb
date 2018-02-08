module Inspec::Formatters
  class ShowProgress < RSpec::Core::Formatters::ProgressFormatter
    RSpec::Core::Formatters.register self

    # remove summary output from progress
    %w{dump_summary dump_failures dump_pending message seed start_dump}.each do |m|
      define_method(m) do |*args|
        # override
      end
    end
  end
end
