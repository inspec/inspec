# encoding: utf-8

include_controls 'profile_a'
include_controls 'profile_b'
include_controls 'os-hardening' do
  skip_control 'package-01'
  skip_control 'package-02'
  skip_control 'package-03'
  skip_control 'package-04'
  skip_control 'package-05'
  1.upto(33) do |i|
    skip_control "sysctl-%02d" % i
  end
end
