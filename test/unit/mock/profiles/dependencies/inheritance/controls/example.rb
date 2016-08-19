# encoding: utf-8

include_controls 'profile_a'
include_controls 'profile_b'
include_controls 'os-hardening' do
  skip_control 'os-01'

  1.upto(5) do |i|
    skip_control "package-%02d" % i
  end

  1.upto(33) do |i|
    skip_control "sysctl-%02d" % i
  end
end
