# encoding: utf-8
# copyright: 2016, Chef Software, Inc.

title 'Gordon Config Checks'

# To pass the test, create the following file
# ```bash
# mkdir -p /tmp/gordon
# cat <<EOF > /tmp/gordon/config.yaml
# version: '1.0'
# EOF
# ```
control 'gordon-1.0' do
  impact 0.7
  title 'Verify the version number of Gordon'
  desc 'An optional description...'
  tag 'gordon'
  ref 'Gordon Requirements 1.0', uri: 'http://...'

  # Test using the custom gordon_config Inspec resource
  # Find the resource content here: ../libraries/
  describe gordon_config do
    it { should exist }
    its('version') { should eq('1.0') }
    its('file_size') { should <= 20 }
    its('comma_count') { should eq 0 }
  end

  # Test the version again to showcase variables
  g = gordon_config
  g_path = g.file_path
  g_version = g.version
  describe file(g_path) do
    its('content') { should match g_version }
  end
end
