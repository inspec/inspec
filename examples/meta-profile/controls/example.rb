# copyright: 2015, The Authors

# import full profile
include_controls 'dev-sec/ssh-baseline'

# select only individual controls
include_controls 'ssl-baseline' do
  control "tls1.2"
end

# inspec knows that it cannot run Windows tests on Linux
include_controls 'windows-patch-baseline'
