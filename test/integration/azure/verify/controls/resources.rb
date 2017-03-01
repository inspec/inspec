
title 'Check Azure Resources'

control 'azure-resources-1.0' do

  impact 1.0
  title 'Check that the resource group has the correct resources'

  # Ensure that the expected resources have been deployed
  describe azure_rg(name: 'Inspec-Azure') do
    its('total') { should eq 7 }
    its('vm_count') { should eq 2 }
    its('nic_count') { should eq 2 }
    its('public_ip_count') { should eq 1 }
    its('sa_count') { should eq 1 }
    its('vnet_count') { should eq 1 }
  end

end