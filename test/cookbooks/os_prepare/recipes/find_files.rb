# This recipe is used to test the function of `Utils::FindFiles`.

directory "/etc/find_files/"

user "secret"
group "secret"

directory "/etc/find_files/secret" do
  mode "600"
  owner "secret"
  group "secret"
end

%w{secret_file1 secret_file2}.each do |f|
  file File.join("/etc/find_files/secret", f) do
    mode "600"
    owner "secret"
    group "secret"
  end
end

directory "/etc/find_files/public" do
  mode "777"
end

%w{public_file1 public_file2}.each do |f|
  file File.join("/etc/find_files/public", f) do
    mode "777"
  end
end
