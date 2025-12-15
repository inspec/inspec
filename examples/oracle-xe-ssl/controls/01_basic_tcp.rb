# encoding: utf-8
# copyright: 2024, Chef Software, Inc.

# Basic TCP Connection Tests
# These tests demonstrate traditional host:port/service connections
# Maintains backward compatibility with existing InSpec code

title 'Oracle Database - Basic TCP Connections'

control 'tcp-basic-connection' do
  impact 1.0
  title 'Connect to Oracle using host:port/service'
  desc 'Verify basic TCP connection works with traditional parameters'
  tag 'tcp'
  tag 'basic'
  
  only_if('Requires oracle_user and oracle_password') do
    !input('oracle_user').nil? && !input('oracle_password').nil?
  end
  
  # Traditional connection method (backward compatible)
  sql = oracledb_session(
    user: input('oracle_user'),
    password: input('oracle_password'),
    host: input('oracle_host'),
    port: input('oracle_port'),
    service: input('oracle_service')
  )
  
  describe sql.query('SELECT 1 AS result FROM dual') do
    its('rows.length') { should eq 1 }
    its('row(0).column("result").value') { should eq '1' }
  end
end

control 'tcp-database-info' do
  impact 0.7
  title 'Query database version and instance information'
  desc 'Verify we can retrieve database metadata over TCP'
  tag 'tcp'
  tag 'metadata'
  
  only_if('Requires oracle_user and oracle_password') do
    !input('oracle_user').nil? && !input('oracle_password').nil?
  end
  
  sql = oracledb_session(
    user: input('oracle_user'),
    password: input('oracle_password'),
    host: input('oracle_host'),
    port: input('oracle_port'),
    service: input('oracle_service')
  )
  
  # Check database version
  describe sql.query('SELECT banner FROM v$version WHERE ROWNUM = 1') do
    its('rows.length') { should eq 1 }
    its('row(0).column("banner").value') { should match(/Oracle Database/) }
  end
  
  # Check instance name
  describe sql.query('SELECT instance_name FROM v$instance') do
    its('rows.length') { should eq 1 }
    its('row(0).column("instance_name").value') { should_not be_nil }
  end
  
  # Check database status
  describe sql.query('SELECT status FROM v$instance') do
    its('row(0).column("status").value') { should eq 'OPEN' }
  end
end

control 'tcp-user-privileges' do
  impact 0.5
  title 'Verify user has basic query privileges'
  desc 'Check that the test user can query system tables'
  tag 'tcp'
  tag 'permissions'
  
  only_if('Requires oracle_user and oracle_password') do
    !input('oracle_user').nil? && !input('oracle_password').nil?
  end
  
  sql = oracledb_session(
    user: input('oracle_user'),
    password: input('oracle_password'),
    host: input('oracle_host'),
    port: input('oracle_port'),
    service: input('oracle_service')
  )
  
  # Verify we can query our own username
  describe sql.query('SELECT USER AS current_user FROM dual') do
    its('row(0).column("current_user").value') { should eq input('oracle_user').upcase }
  end
  
  # Verify we can see session information
  describe sql.query('SELECT COUNT(*) AS session_count FROM v$session WHERE username = UPPER(USER)') do
    its('rows.length') { should eq 1 }
    # Should have at least 1 session (our current connection)
    its('row(0).column("session_count").value.to_i') { should be >= 1 }
  end
end

control 'tcp-sql-operations' do
  impact 0.5
  title 'Test basic SQL operations over TCP'
  desc 'Verify SELECT, aggregate functions, and data type handling'
  tag 'tcp'
  tag 'sql'
  
  only_if('Requires oracle_user and oracle_password') do
    !input('oracle_user').nil? && !input('oracle_password').nil?
  end
  
  sql = oracledb_session(
    user: input('oracle_user'),
    password: input('oracle_password'),
    host: input('oracle_host'),
    port: input('oracle_port'),
    service: input('oracle_service')
  )
  
  # Test numeric operations
  describe sql.query('SELECT 2 + 2 AS sum, 10 * 5 AS product FROM dual') do
    its('row(0).column("sum").value') { should eq '4' }
    its('row(0).column("product").value') { should eq '50' }
  end
  
  # Test string operations
  describe sql.query("SELECT UPPER('hello') AS upper_text, LENGTH('test') AS text_length FROM dual") do
    its('row(0).column("upper_text").value') { should eq 'HELLO' }
    its('row(0).column("text_length").value') { should eq '4' }
  end
  
  # Test date functions
  describe sql.query("SELECT TO_CHAR(SYSDATE, 'YYYY') AS current_year FROM dual") do
    its('row(0).column("current_year").value.to_i') { should be >= 2024 }
  end
end
