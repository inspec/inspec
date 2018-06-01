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

describe '3103 default methods for filter table' do
  include FunctionalHelper

  it 'positive tests should pass' do
    controls = [
      '3103_where_defined',
      '3103_entries_defined',
      '3103_raw_data_defined',
      '3103_exists_defined',
      '3103_count_defined',
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
end

describe '2370 lazy_load for filter table' do
  include FunctionalHelper

  it 'positive tests should pass' do
    controls = [
      '2370_where_block',
      '2370_where_block_only_referenced',
      '2370_where_method',
      '2370_where_method_only_referenced',
      '2370_populate_once',
      '2370_no_side_populate',
      '2370_no_clobber',
      '2370_list_property',
      '2370_list_property_filter_method',
      '2370_list_property_filter_block',
      '2370_no_rows',
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
      '2370_proc_handle_exception',
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

describe '3110 do not expose block-valued properties in raw data' do
  include FunctionalHelper

  it 'positive tests should pass' do
    controls = [
      '3110_entries_defined',
      '3110_raw_data_defined',
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
end
