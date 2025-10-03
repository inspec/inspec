# copyright: 2018, The Authors

title "IBM Db2 Profile"

control "db2-1.0" do
  impact 0.7
  title "Check IBM Db2 Session"
  desc "Ensure IBM Db2 session is configured correctly"
  describe ibmdb2_session(db2_executable_file_path: "/path/to/db2", db_instance: "db2inst1", db_name: "sample").query('list database directory') do
    its('output') { should_not match(/sample/) }
  end
end

control "db2-2.0" do
  impact 0.7
  title "Check IBM Db2 Configuration"
  desc "Ensure IBM Db2 configuration is set correctly"
  describe ibmdb2_conf(db2_executable_file_path: "/path/to/db2", db_instance: "db2inst1") do
    its("output") { should_not be_empty }
    its("output") { should include("Audit buffer size (4KB) (AUDIT_BUF_SZ) = 0") }
  end
end
