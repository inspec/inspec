require 'stringio'

class DeprecationTester < Inspec.resource(1)
  name :deprecation_tester

  DEPRECATION_CFG = <<~EOC
    {
      "file_version": "1.0.0",
      "unknown_group_action": "warn",
      "groups": {
        "a_group_that_will_warn": { "action": "warn" },
        "a_group_that_will_exit": { "action": "exit"  },
        "a_group_that_will_exit_with_a_code": { "action": "exit", "exit_status": 8 },
        "an_ignored_group": { "action": "ignore" },
        "a_group_that_will_fail": { "action": "fail_control" }
      }
    }
  EOC

  def fail_me
    Inspec.deprecate(:a_group_that_will_fail, 'This should fail', config_io: StringIO.new(DEPRECATION_CFG))

    'fail_me_return_value'
  end

  def exit_me_default_code
    Inspec.deprecate(:a_group_that_will_exit, 'This should exit', config_io: StringIO.new(DEPRECATION_CFG))

    'exit_me_return_value'
  end

  def exit_me_explicit_code
    Inspec.deprecate(:a_group_that_will_exit_with_a_code, 'This should exit', config_io: StringIO.new(DEPRECATION_CFG))

    'exit_me_return_value'
  end

  def ignore_me
    Inspec.deprecate(:an_ignored_group, 'This should be ignored', config_io: StringIO.new(DEPRECATION_CFG))

    'ignore_me_return_value'
  end

  def warn_me
    Inspec.deprecate(:a_group_that_will_warn, 'This should warn', config_io: StringIO.new(DEPRECATION_CFG))

    'warn_me_return_value'
  end
end
