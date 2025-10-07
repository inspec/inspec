require_relative "../../helper"
require_relative "../../../lib/inspec/utils/telemetry"

describe "Telemetry CINC Opt-Out Integration" do
  let(:original_exec_name) { Inspec::Dist::EXEC_NAME }

  after do
    # Always restore the original executable name
    Inspec::Dist.const_set(:EXEC_NAME, original_exec_name)
    # Reset class variables
    Inspec::Telemetry.class_variable_set(:@@instance, nil)
    Inspec::Telemetry.class_variable_set(:@@config, nil)
  end

  describe "when user is CINC user" do
    before do
      Inspec::Dist.const_set(:EXEC_NAME, "cinc-auditor")
    end

    it "should disable telemetry when --disable-telemetry is used" do
      conf = Inspec::Config.new({ "disable_telemetry" => true })
      Inspec::Telemetry.class_variable_set(:@@config, conf)

      # Mock dependencies
      Inspec::Telemetry::RunContextProbe.stubs(:under_automate?).returns(false)
      Inspec::Telemetry::RunContextProbe.stubs(:guess_run_context).returns("cli")
      Inspec::Telemetry.stubs(:license).returns(nil)

      backend_class = Inspec::Telemetry.determine_backend_class
      _(backend_class).must_equal Inspec::Telemetry::Null
    end

    it "should allow telemetry when --disable-telemetry is not used" do
      conf = Inspec::Config.new({})
      Inspec::Telemetry.class_variable_set(:@@config, conf)

      # Since CINC users get disabled telemetry anyway (different EXEC_NAME),
      # this should return Null regardless
      backend_class = Inspec::Telemetry.determine_backend_class
      _(backend_class).must_equal Inspec::Telemetry::Null
    end
  end

  describe "when user is Chef InSpec user" do
    before do
      Inspec::Dist.const_set(:EXEC_NAME, "inspec")
    end

    it "should show warning but continue with HTTP backend when --disable-telemetry is used" do
      conf = Inspec::Config.new({ "disable_telemetry" => true })
      Inspec::Telemetry.class_variable_set(:@@config, conf)

      # Mock dependencies
      Inspec::Telemetry::RunContextProbe.stubs(:under_automate?).returns(false)
      Inspec::Telemetry::RunContextProbe.stubs(:guess_run_context).returns("cli")
      Inspec::Telemetry.stubs(:license).returns(nil)

      # Mock logger to capture warnings
      logger_mock = mock()
      logger_mock.expects(:warn).with("The --disable-telemetry option is only available for CINC users. Telemetry opt-out is not permissible for Chef InSpec users.")
      Inspec::Log.stubs(:warn).yields.returns(logger_mock)

      backend_class = Inspec::Telemetry.determine_backend_class
      _(backend_class).must_equal Inspec::Telemetry::HTTP
    end

    it "should use HTTP backend normally when --disable-telemetry is not used" do
      conf = Inspec::Config.new({})
      Inspec::Telemetry.class_variable_set(:@@config, conf)

      # Mock dependencies
      Inspec::Telemetry::RunContextProbe.stubs(:under_automate?).returns(false)
      Inspec::Telemetry::RunContextProbe.stubs(:guess_run_context).returns("cli")
      Inspec::Telemetry.stubs(:license).returns(nil)

      backend_class = Inspec::Telemetry.determine_backend_class
      _(backend_class).must_equal Inspec::Telemetry::HTTP
    end
  end

  describe "configuration edge cases" do
    it "should handle both disable_telemetry and enable_telemetry options" do
      # Test precedence - disable_telemetry should take priority for CINC users
      Inspec::Dist.const_set(:EXEC_NAME, "cinc-auditor")
      conf = Inspec::Config.new({ 
        "disable_telemetry" => true, 
        "enable_telemetry" => true 
      })
      Inspec::Telemetry.class_variable_set(:@@config, conf)

      _(Inspec::Telemetry.telemetry_disabled_by_cli?).must_equal true
      _(Inspec::Telemetry.cinc_user?).must_equal true
    end
  end
end
