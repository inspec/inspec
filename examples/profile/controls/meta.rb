title 'SSH Server Configuration'

control 'ssh-1' do
  impact 1.0

  title 'Allow only SSH Protocol 2'
  desc 'Only SSH protocol version 2 connections should be permitted.
        The default setting in /etc/ssh/sshd_config is correct, and can be
        verified by ensuring that the following line appears: Protocol 2'

  tag 'production','development'
  tag 'ssh','sshd','openssh-server'

  tag cce: 'CCE-27072-8'
  tag disa: 'RHEL-06-000227'

  tag nist: 'AC-3(10).i'
  tag nist: 'IA-5(1)'

  tag cci: 'CCI-000776'
  tag cci: 'CCI-000774'
  tag cci: 'CCI-001436'

  tag remediation: 'stig_rhel6/recipes/sshd-config.rb'
  tag remediation: 'https://supermarket.chef.io/cookbooks/ssh-hardening'

  ref 'NSA-RH6-STIG - Section 3.5.2.1', url: 'https://www.nsa.gov/ia/_files/os/redhat/rhel5-guide-i731.pdf'
  ref 'DISA-RHEL6-SG - Section 9.2.1', url: 'http://iasecontent.disa.mil/stigs/zip/Jan2016/U_RedHat_6_V1R10_STIG.zip'
  ref 'http://people.redhat.com/swells/scap-security-guide/RHEL/6/output/ssg-centos6-guide-C2S.html'

  describe file('/bin/sh') do
    it { should be_owned_by 'root' }
  end
end
