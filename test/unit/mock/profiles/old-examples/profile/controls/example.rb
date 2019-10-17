# copyright: 2016, Chef Software, Inc.

title 'Example Config Checks'

# To pass the test, create the following file
# ```bash
# mkdir -p /tmp/example
# cat <<EOF > /tmp/example/config.yaml
# version: '1.0'
# EOF
# ```
control 'example-1.0' do
  impact 'critical'
  title 'Verify the version number of Example'
  desc 'An optional description...'
  tag 'example'
  ref 'Example Requirements 1.0', uri: 'http://...'

  # Test using the custom example_config InSpec resource
  # Find the resource content here: ../libraries/
  describe example_config do
    it { should exist }
    its('version') { should eq('1.0') }
    its('file_size') { should <= 20 }
    its('comma_count') { should eq 0 }
  end

  # Test the version again to showcase variables
  g = example_config
  g_path = g.file_path
  g_version = g.version
  describe file(g_path) do
    its('content') { should match g_version }
  end
end
