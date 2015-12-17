# encoding: utf-8

if os.windows?
  describe security_policy do
    its('EnableAdminAccount') { should eq 1 }
    its('EnableGuestAccount') { should eq 0 }
  end
end
