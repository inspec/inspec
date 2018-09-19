include_controls 'child_profile_NEW_NAME'

include_controls 'child_profile2' do
  control 'test override control on parent using child attribute' do
    describe attribute('val_numeric') do
      it { should cmp 654321 }
    end
  end

  control 'test override control on parent using parent attribute' do
    describe Inspec::AttributeRegistry.find_attribute('val_numeric', 'attributes').value do
      it { should cmp 443 }
    end
  end
end
