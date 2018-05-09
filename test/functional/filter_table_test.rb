require 'functional/helper'

describe '2943 inspec exec for filter table profile, method mode for `where' do
  include FunctionalHelper

  it 'positive tests should pass' do
    controls = [
      '2943_pass_undeclared_field_in_hash',
      '2943_pass_irregular_row_key',
      '2943_pass_raise_error_when_key_not_in_data',
      '2943_pass_no_error_when_no_data',
    ]

    cmd  = 'exec ' + File.join(profile_path, 'filter_table')
    cmd += ' --reporter json --no-create-lockfile' 
    cmd += ' --controls ' + controls.join(' ')
    cmd = inspec(cmd)

    # RSpec keeps issuing a deprecation count to stdout; I can't seem to disable it.
    output = cmd.stdout.split("\n").reject {|line| line =~ /deprecation/}.join("\n")
    data = JSON.parse(output)
    failed_controls = data['profiles'][0]['controls'].select { |ctl| ctl['results'][0]['status'] == 'failed' }
    control_hash = {}
    failed_controls.each do |ctl|
      control_hash[ctl['id']] = ctl['results'][0]['message']
    end
    control_hash.must_be_empty
    cmd.exit_status.must_equal 0
  end

  it 'negative tests should fail but not abort' do
    controls = [
      '2943_fail_derail_check',
    ]

    cmd = inspec('exec ' + File.join(profile_path, 'filter_table') + ' --reporter json --no-create-lockfile' + ' --controls ' + controls.join(' '))

    data = JSON.parse(cmd.stdout)
    failed_controls = data['profiles'][0]['controls'].select { |ctl| ctl['results'][0]['status'] == 'failed' }
    control_hash = {}
    failed_controls.each do |ctl|
      control_hash[ctl['id']] = ctl['results'][0]['message']
    end
    controls.each do |expected_control| 
      control_hash.keys.must_include(expected_control)
    end

    cmd.stderr.must_equal ''
    cmd.exit_status.must_equal 100
  end
end

describe '2929 exceptions in block-mode where' do
  include FunctionalHelper
  it 'positive tests should pass' do
    controls = [
      '2929_exception_in_where',
    ]

    cmd = inspec('exec ' + File.join(profile_path, 'filter_table') + ' --reporter json --no-create-lockfile' + ' --controls ' + controls.join(' '))

    data = JSON.parse(cmd.stdout)
    failed_controls = data['profiles'][0]['controls'].select { |ctl| ctl['results'][0]['status'] == 'failed' }
    control_hash = {}
    failed_controls.each do |ctl|
      control_hash[ctl['id']] = ctl['results'][0]['message']
    end
    control_hash.must_be_empty
    cmd.stderr.must_equal ''
    cmd.exit_status.must_equal 0
  end  
end
