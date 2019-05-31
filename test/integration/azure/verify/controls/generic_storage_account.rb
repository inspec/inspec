title 'Check Azure Resources'

control 'azure-generic-storage-account-2.0' do

  impact 1.0
  title 'Check the storage account'

  # Get the storage account by type, this is because in the tests
  # the storage account name is randomly generated so it cannot be known to perform
  # these inspec tests
  describe azure_generic_resource(group_name: 'Inspec-Azure', type: 'Microsoft.Storage/storageAccounts') do
    its('total') { should be 1 }

    # There should be no tags
    it { should_not have_tags }

    # Check that the blob and file services are enabled
    its('properties.encryption.services.blob.enabled') { should be true }
    its('properties.encryption.services.file.enabled') { should be true }
    its('properties.encryption.keySource') { should cmp 'Microsoft.Storage' }

    its('properties.provisioningState') { should cmp 'Succeeded' }

    its('properties.primaryLocation') { should cmp 'westeurope' }
    its('properties.statusOfPrimary') { should cmp 'available' }

    # Determine if it only supports HTTPS traffic
    its('properties.supportsHttpsTrafficOnly') { should be false }
  end
end
