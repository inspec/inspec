host = input("mysql_db_instance_address", value: nil)
username = input("mysql_db_username", value: nil)
password = input("mysql_db_password", value: nil)

control "mysql_session" do

  title "Testing the mysql_session resource."
  desc "Testing the mysql_session resource."

  sql = mysql_session(username, password, host)
  describe sql.query("show databases;") do
    its('exit_status') { should eq(0) }
  end

  describe sql.query('show databases like \'test\';') do
    its('output') { should_not match(/test/) }
  end

  describe sql.query('show databases like \'mydb\';') do
    its('output') { should match(/mydb/) }
  end
end