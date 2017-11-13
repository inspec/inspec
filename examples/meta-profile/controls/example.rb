# encoding: utf-8
# copyright: 2015, The Authors

# import full profile
include_controls 'dev-sec/ssh-baseline'

# select only individual controls
include_controls 'ssl-baseline' do
  control "tls1.2"
end
