# Search for file that has mode 0600
describe test_find_files("/etc/find_files/secret/secret_file1") do
  its("results") { should include "/etc/find_files/secret/secret_file1" }
end

# Search for file that is publicly readable
describe test_find_files("/etc/find_files/public/public_file1") do
  its("results") { should include "/etc/find_files/public/public_file1" }
end

# Wildcard search with files that have mode 0600
describe test_find_files("/etc/find_files/secret/*") do
  its("results") { should include "/etc/find_files/secret/secret_file1" }
  its("results") { should include "/etc/find_files/secret/secret_file2" }
end

# Wildcard search with files that are publicly readable
describe test_find_files("/etc/find_files/public/*") do
  its("results") { should include "/etc/find_files/public/public_file1" }
  its("results") { should include "/etc/find_files/public/public_file2" }
end
