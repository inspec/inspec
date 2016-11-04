# encoding: utf-8
# copyright: 2016, Chef Software, Inc.
# license: All rights reserved

# manipulate controls of `profile`
include_controls 'profile' do
  skip_control 'tmp-1.0'

  control 'gordon-1.0' do
    impact 0.0
  end
end

# load all controls of `profile-attribute`
include_controls 'profile-attribute'
