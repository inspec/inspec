module InspecPlugins::<%= module_name %>
  # This class will provide the actual Reporter implementation.
  # Its superclass is provided by another call to Inspec.plugin,
  # this time with two args.  The first arg specifies we are requesting
  # version 2 of the Plugins API.  The second says we are making a
  # Reporter plugin component, so please make available any DSL needed
  # for that.

  class Reporter < Inspec.plugin(2, :reporter)

    # All a Reporter *must* do is define a render() method that calls
    # output(). You should access the run_data accessor to read off the
    # results of the run.
    def render
      # There is much more to explore in the run_data structure!
      run_data[:profiles].each do |profile|
        output(profile[:title])
        profile[:controls].each do |control|
          output(control[:title])
          control[:results].each do |test|
            output(test[:status])
          end
        end
      end
    end
  end
end
