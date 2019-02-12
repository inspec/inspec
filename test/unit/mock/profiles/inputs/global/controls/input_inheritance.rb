include_controls 'child_profile_NEW_NAME'

include_controls 'child_profile2' do
  control 'test override control on parent using child input' do
    describe input('val_numeric') do
      it { should cmp 654321 }
    end
  end

  control 'test override control on parent using parent input' do
    describe Inspec::InputRegistry.find_input('val_numeric', 'inputs').value do
      it { should cmp 443 }
    end
  end
end
