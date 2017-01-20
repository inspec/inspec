
title 'Sample profile to test the Image SKU of a vm'

control 'azurevm-image-1.0' do
  impact 1.0
  title 'Ensure that the machine has an image SKU of 16.04.0-LTS'
  describe azurevm_image(host: 'exmaple-01', resource_group: 'MyResourceGroup') do
    its('sku') { should eq '16.04.0-LTS' }
    its('publisher') { should eq 'Canonical' }
    its('offer') { should eq 'UbuntuServer' }
  end
end
