# This file tests the audit validation which runs as part of the
# chef-client process. This is setup to export to a json file in the .kitchen.yml
#
# For more info please see docs/dev/integratin_test.md

control 'Test audit cookbook json exist' do
  describe file('/tmp/json_export.json') do
    it { should exist }
    its('size') { should > 0 }
  end
end

# Grab bundled inspec version. This should be the same as the one
# passed for audit cookbook. If its not, you should do a `bundle install`
inspec_version = Inspec::VERSION
# or: Gem.loaded_specs['inspec'].version.to_s rescue Inspec::VERSION

control 'Test audit cookbook json output' do
  describe json('/tmp/json_export.json') do
    its(['platform', 'name']) { should eq platform.name }
    its(['statistics', 'duration']) { should  > 0 }
    its('version') { should cmp inspec_version }
  end
end

# test kitchen verify attr passthrough
attr = attribute('verifier_attribute', default: 'none') # TODO: update test-kitchen to replace attribute -> input
control 'validate verifier attribute override' do
  describe attr do
    it { should eq 'Attribute Override!' }
  end
end

# make sure all tests passed
file = file('/tmp/json_export.json')
if file.exist?
  json = JSON.parse(file.content)
  json['profiles'].first['controls'].each do |child_control|
    child_control['results'].each do |result|
      control result['code_desc'] do
        describe json(content: result.to_json) do
          its('status') { should cmp 'passed' }
        end
      end
    end
  end
end
