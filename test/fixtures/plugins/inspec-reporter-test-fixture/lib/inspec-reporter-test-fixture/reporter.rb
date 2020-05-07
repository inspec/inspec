module InspecPlugins::ReporterTestFixture
  class ReporterImplementation < Inspec.plugin(2, :reporter)

    # The test reporter plugin returns a single line of output, like this:
    # pXX:cYY:tZZ
    # where XX is the count of profiles
    #       YY is the count of controls
    #       ZZ is the count of tests
    def render
      profile_count = run_data[:profiles].count
      control_count = 0
      test_count = 0
      run_data[:profiles].each do |p|
        controls = p[:controls] || []
        control_count += controls.count
        controls.each do |c|
          tests = c[:results] || []
          test_count += tests.count
        end
      end

      output("p#{profile_count}c#{control_count}t#{test_count}", true)
    end

    def self.run_data_schema_constraints
      ">= 0.0"
    end
  end
end
