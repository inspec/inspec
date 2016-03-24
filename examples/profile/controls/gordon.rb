# encoding: utf-8
# copyright: 2016, Chef Software, Inc.
# license: All rights reserved

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
  describe gordon_config do
    its('version') { should eq('1.0') }
    its('size') { should <= 20 }
  end
end
