# encoding: utf-8
# copyright: 2024, Chef Software, Inc.

# TNS Alias Connection Tests
# These tests demonstrate the new TNS alias functionality added in CHEF-28019
# TNS aliases allow connecting via tnsnames.ora entries instead of hardcoded host:port

title 'Oracle Database - TNS Alias Connections'

control 'tns-alias-connection' do
  impact 1.0
  title 'Connect to Oracle using TNS alias'
  desc 'Verify connection works using TNS alias from tnsnames.ora (CHEF-28019)'
  tag 'tns'
  tag 'chef-28019'
  
  only_if('Requires TNS configuration') do
    !input('oracle_user').nil? && 
    !input('oracle_password').nil? && 
    !input('tns_alias_tcp').nil? &&
    !input('tns_admin_path').nil?
  end
  
  # NEW: Connect using TNS alias with environment variables
  sql = oracledb_session(
    user: input('oracle_user'),
    password: input('oracle_password'),
    tns_alias: input('tns_alias_tcp'),
    env: {
      'TNS_ADMIN' => input('tns_admin_path')
    },
    debug: input('debug_mode')
  )
  
  describe sql.query('SELECT 1 AS result FROM dual') do
    its('rows.length') { should eq 1 }
    its('row(0).column("result").value') { should eq '1' }
  end
end

control 'tns-with-ld-library-path' do
  impact 0.8
  title 'TNS connection with LD_LIBRARY_PATH set'
  desc 'Verify environment variable support for Oracle client libraries'
  tag 'tns'
  tag 'env-vars'
  tag 'chef-28019'
  
  only_if('Requires TNS and library path configuration') do
    !input('oracle_user').nil? && 
    !input('oracle_password').nil? && 
    !input('tns_alias_tcp').nil? &&
    !input('tns_admin_path').nil? &&
    !input('ld_library_path').nil?
  end
  
  # NEW: Set multiple environment variables including library path
  env_vars = {
    'TNS_ADMIN' => input('tns_admin_path'),
    'LD_LIBRARY_PATH' => input('ld_library_path')
  }
  
  # Add ORACLE_HOME if provided
  env_vars['ORACLE_HOME'] = input('oracle_home') if !input('oracle_home').nil?
  
  sql = oracledb_session(
    user: input('oracle_user'),
    password: input('oracle_password'),
    tns_alias: input('tns_alias_tcp'),
    env: env_vars,
    sqlplus_bin: input('sqlplus_bin'),
    debug: input('debug_mode')
  )
  
  # Verify connection works
  describe sql.query('SELECT 1 FROM dual') do
    its('rows.length') { should eq 1 }
  end
  
  # Verify we're connected to the expected service
  describe sql.query('SELECT sys_context(\'USERENV\', \'SERVICE_NAME\') AS service FROM dual') do
    its('row(0).column("service").value') { should match(/XEPDB1|XE/) }
  end
end

control 'tns-network-protocol' do
  impact 0.7
  title 'Verify network protocol used in TNS connection'
  desc 'Check that TNS connection uses expected protocol (TCP)'
  tag 'tns'
  tag 'networking'
  
  only_if('Requires TNS configuration') do
    !input('oracle_user').nil? && 
    !input('oracle_password').nil? && 
    !input('tns_alias_tcp').nil? &&
    !input('tns_admin_path').nil?
  end
  
  sql = oracledb_session(
    user: input('oracle_user'),
    password: input('oracle_password'),
    tns_alias: input('tns_alias_tcp'),
    env: {
      'TNS_ADMIN' => input('tns_admin_path')
    }
  )
  
  # Query the network protocol
  describe sql.query("SELECT sys_context('USERENV', 'NETWORK_PROTOCOL') AS protocol FROM dual") do
    its('row(0).column("protocol").value') { should eq 'tcp' }
  end
end

control 'tns-session-info' do
  impact 0.5
  title 'Retrieve session information via TNS'
  desc 'Verify we can query session details when connected via TNS alias'
  tag 'tns'
  tag 'metadata'
  
  only_if('Requires TNS configuration') do
    !input('oracle_user').nil? && 
    !input('oracle_password').nil? && 
    !input('tns_alias_tcp').nil? &&
    !input('tns_admin_path').nil?
  end
  
  sql = oracledb_session(
    user: input('oracle_user'),
    password: input('oracle_password'),
    tns_alias: input('tns_alias_tcp'),
    env: {
      'TNS_ADMIN' => input('tns_admin_path')
    }
  )
  
  # Get current username
  describe sql.query("SELECT sys_context('USERENV', 'SESSION_USER') AS username FROM dual") do
    its('row(0).column("username").value') { should eq input('oracle_user').upcase }
  end
  
  # Get session ID
  describe sql.query("SELECT sys_context('USERENV', 'SID') AS sid FROM dual") do
    its('row(0).column("sid").value.to_i') { should be > 0 }
  end
  
  # Get host name (where client is running)
  describe sql.query("SELECT sys_context('USERENV', 'HOST') AS host FROM dual") do
    its('row(0).column("host").value') { should_not be_nil }
  end
end

control 'tns-backward-compatibility' do
  impact 0.8
  title 'Verify TNS alias feature maintains backward compatibility'
  desc 'Ensure old connection method still works alongside new TNS alias method'
  tag 'tns'
  tag 'backward-compat'
  tag 'chef-28019'
  
  only_if('Requires both connection methods configured') do
    !input('oracle_user').nil? && 
    !input('oracle_password').nil? && 
    !input('oracle_host').nil? &&
    !input('oracle_service').nil? &&
    !input('tns_alias_tcp').nil? &&
    !input('tns_admin_path').nil?
  end
  
  # Old method: host:port/service
  old_sql = oracledb_session(
    user: input('oracle_user'),
    password: input('oracle_password'),
    host: input('oracle_host'),
    port: input('oracle_port'),
    service: input('oracle_service')
  )
  
  # New method: TNS alias
  new_sql = oracledb_session(
    user: input('oracle_user'),
    password: input('oracle_password'),
    tns_alias: input('tns_alias_tcp'),
    env: {
      'TNS_ADMIN' => input('tns_admin_path')
    }
  )
  
  # Both should connect successfully
  describe 'Old connection method (host:port/service)' do
    subject { old_sql.query('SELECT 1 FROM dual') }
    its('rows.length') { should eq 1 }
  end
  
  describe 'New connection method (TNS alias)' do
    subject { new_sql.query('SELECT 1 FROM dual') }
    its('rows.length') { should eq 1 }
  end
  
  # Both should connect to same database
  old_db_name = old_sql.query("SELECT sys_context('USERENV', 'DB_NAME') AS name FROM dual").row(0).column('name').value
  new_db_name = new_sql.query("SELECT sys_context('USERENV', 'DB_NAME') AS name FROM dual").row(0).column('name').value
  
  describe 'Database name should match between connection methods' do
    it { expect(old_db_name).to eq(new_db_name) }
  end
end
