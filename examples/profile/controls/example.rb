# encoding: utf-8
# copyright: 2015, Chef Software, Inc.
# license: All rights reserved

title '/tmp profile'

control "tmp-1.0" do                        # A unique ID for this control
  impact 0.0                                # The criticality, if this control fails.
  title "Create /tmp directory"             # A human-readable title
  desc "An optional description..."
  describe file('/tmp') do                  # The actual test
    it { should be_directory }
  end
end
