require 'functional/helper'

describe 'inspec exec against the filter_table profile suite' do
  include FunctionalHelper

  it 'can execute the profile' do
    cmd = inspec('exec ' + File.join(profile_path, 'filter_table') + ' --reporter json --no-create-lockfile')
    # cmd.stderr.must_equal ''
    # cmd.exit_status.must_equal 0
    data = JSON.parse(cmd.stdout)
    failed_controls = data['profiles'][0]['controls'].select { |ctl| ctl['results'][0]['status'] == 'failed' }
    control_hash = {}
    failed_controls.each do |ctl|
      control_hash[ctl['id']] = ctl['results'][0]['message']
    end
    control_hash.must_be_empty
  end
end