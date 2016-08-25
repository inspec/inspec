# encoding: utf-8

include_controls 'profile_a'
include_controls 'profile_b'
include_controls 'ssh-hardening' do
  12.upto(12) do |i|
    skip_control "ssh-%02d" % i
  end
end
