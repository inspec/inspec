include_controls "myprofile1" do
  # skip this useless control
  skip_control "pro1-con3"

  # fix this control from the profile we inherit
  control "pro1-con2" do
    impact 0.999
    title "Profile 1 - Control 2-updated"
    desc "Profile 1 - Control 2 description-updated"
    desc "overwrite me", "it is overwritten"
    desc "new entry", "this is appended to the description list"
    tag "password-updated"
    ref "Section 3.5.2.1", url: "https://example.com"
    describe file("/etc/passwd") do
      it { should exist }
    end
  end
end
