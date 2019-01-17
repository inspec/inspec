control "char" do
  title "ensure we have the right characterset"
  desc "Ensure we do not freak out with “"
  describe inspec.profile.file("ascii").force_encoding(Encoding::ISO_8859_1) do
    it { should_not match(/conceptually/) }
  end
end
