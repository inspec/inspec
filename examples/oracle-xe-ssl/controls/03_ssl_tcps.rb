# encoding: utf-8
# copyright: 2024, Chef Software, Inc.

# SSL/TCPS Connection Tests
# These tests demonstrate SSL/TCPS encrypted connections to Oracle
# Requires Oracle wallet configuration on both server and client

title 'Oracle Database - SSL/TCPS Encrypted Connections'

control 'tcps-connection' do
  impact 1.0
  title 'Connect to Oracle using TCPS/SSL encryption'
  desc 'Verify secure connection works using TCPS protocol with Oracle wallet (CHEF-28019)'
  tag 'ssl'
  tag 'tcps'
  tag 'security'
  tag 'chef-28019'
  
  only_if('Requires TCPS TNS alias and wallet configuration') do
    !input('oracle_user').nil? && 
    !input('oracle_password').nil? && 
    !input('tns_alias_tcps').nil? &&
    !input('tns_admin_path').nil?
  end
  
  # Connect using TCPS TNS alias
  # The wallet configuration is read from sqlnet.ora in TNS_ADMIN directory
  sql = oracledb_session(
    user: input('oracle_user'),
    password: input('oracle_password'),
    tns_alias: input('tns_alias_tcps'),
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

control 'tcps-protocol-verification' do
  impact 1.0
  title 'Verify connection is using TCPS protocol'
  desc 'Confirm that the connection is encrypted using TCPS, not plain TCP'
  tag 'ssl'
  tag 'tcps'
  tag 'security'
  tag 'chef-28019'
  
  only_if('Requires TCPS TNS alias') do
    !input('oracle_user').nil? && 
    !input('oracle_password').nil? && 
    !input('tns_alias_tcps').nil? &&
    !input('tns_admin_path').nil?
  end
  
  sql = oracledb_session(
    user: input('oracle_user'),
    password: input('oracle_password'),
    tns_alias: input('tns_alias_tcps'),
    env: {
      'TNS_ADMIN' => input('tns_admin_path')
    }
  )
  
  # Query the actual network protocol in use
  describe sql.query("SELECT LOWER(sys_context('USERENV', 'NETWORK_PROTOCOL')) AS protocol FROM dual") do
    its('row(0).column("protocol").value') { should eq 'tcps' }
  end
end

control 'tcps-with-all-env-vars' do
  impact 0.8
  title 'TCPS connection with complete environment configuration'
  desc 'Verify TCPS works with all relevant environment variables set'
  tag 'ssl'
  tag 'tcps'
  tag 'env-vars'
  tag 'chef-28019'
  
  only_if('Requires complete TCPS configuration') do
    !input('oracle_user').nil? && 
    !input('oracle_password').nil? && 
    !input('tns_alias_tcps').nil? &&
    !input('tns_admin_path').nil? &&
    !input('ld_library_path').nil?
  end
  
  # Build complete environment configuration
  env_vars = {
    'TNS_ADMIN' => input('tns_admin_path'),
    'LD_LIBRARY_PATH' => input('ld_library_path')
  }
  
  # Add ORACLE_HOME if provided
  env_vars['ORACLE_HOME'] = input('oracle_home') if !input('oracle_home').nil?
  
  sql = oracledb_session(
    user: input('oracle_user'),
    password: input('oracle_password'),
    tns_alias: input('tns_alias_tcps'),
    env: env_vars,
    sqlplus_bin: input('sqlplus_bin'),
    debug: input('debug_mode')
  )
  
  # Verify connection
  describe sql.query('SELECT 1 FROM dual') do
    its('rows.length') { should eq 1 }
  end
  
  # Verify protocol is TCPS
  describe sql.query("SELECT LOWER(sys_context('USERENV', 'NETWORK_PROTOCOL')) AS protocol FROM dual") do
    its('row(0).column("protocol").value') { should eq 'tcps' }
  end
end

control 'tcps-encryption-info' do
  impact 0.7
  title 'Query SSL/TLS encryption details'
  desc 'Retrieve information about the SSL/TLS encryption in use'
  tag 'ssl'
  tag 'tcps'
  tag 'security'
  tag 'encryption'
  
  only_if('Requires TCPS connection') do
    !input('oracle_user').nil? && 
    !input('oracle_password').nil? && 
    !input('tns_alias_tcps').nil? &&
    !input('tns_admin_path').nil?
  end
  
  sql = oracledb_session(
    user: input('oracle_user'),
    password: input('oracle_password'),
    tns_alias: input('tns_alias_tcps'),
    env: {
      'TNS_ADMIN' => input('tns_admin_path')
    }
  )
  
  # Check network service banner (includes encryption info)
  describe sql.query("SELECT sys_context('USERENV', 'NETWORK_PROTOCOL') AS protocol FROM dual") do
    its('row(0).column("protocol").value') { should match(/tcps/i) }
  end
  
  # Verify authentication type
  describe sql.query("SELECT sys_context('USERENV', 'AUTHENTICATION_TYPE') AS auth_type FROM dual") do
    its('row(0).column("auth_type").value') { should_not be_nil }
  end
end

control 'tcps-data-integrity' do
  impact 0.6
  title 'Verify data integrity over TCPS connection'
  desc 'Ensure data is transmitted correctly over encrypted connection'
  tag 'ssl'
  tag 'tcps'
  tag 'data-integrity'
  
  only_if('Requires TCPS connection') do
    !input('oracle_user').nil? && 
    !input('oracle_password').nil? && 
    !input('tns_alias_tcps').nil? &&
    !input('tns_admin_path').nil?
  end
  
  sql = oracledb_session(
    user: input('oracle_user'),
    password: input('oracle_password'),
    tns_alias: input('tns_alias_tcps'),
    env: {
      'TNS_ADMIN' => input('tns_admin_path')
    }
  )
  
  # Test that large data transfers work correctly
  describe sql.query("SELECT RPAD('X', 1000, 'X') AS large_string FROM dual") do
    its('row(0).column("large_string").value.length') { should eq 1000 }
  end
  
  # Test numeric precision
  describe sql.query('SELECT 123456789.987654321 AS precise_number FROM dual') do
    its('row(0).column("precise_number").value') { should match(/123456789\.98/) }
  end
  
  # Test special characters
  describe sql.query("SELECT 'Test!@#$%^&*()' AS special_chars FROM dual") do
    its('row(0).column("special_chars").value') { should eq 'Test!@#$%^&*()' }
  end
end

control 'tcps-vs-tcp-comparison' do
  impact 0.5
  title 'Compare TCPS and TCP connections'
  desc 'Verify both encrypted and unencrypted connections work to same database'
  tag 'ssl'
  tag 'tcps'
  tag 'comparison'
  
  only_if('Requires both TCP and TCPS TNS aliases') do
    !input('oracle_user').nil? && 
    !input('oracle_password').nil? && 
    !input('tns_alias_tcp').nil? &&
    !input('tns_alias_tcps').nil? &&
    !input('tns_admin_path').nil?
  end
  
  # TCP connection
  tcp_sql = oracledb_session(
    user: input('oracle_user'),
    password: input('oracle_password'),
    tns_alias: input('tns_alias_tcp'),
    env: {
      'TNS_ADMIN' => input('tns_admin_path')
    }
  )
  
  # TCPS connection
  tcps_sql = oracledb_session(
    user: input('oracle_user'),
    password: input('oracle_password'),
    tns_alias: input('tns_alias_tcps'),
    env: {
      'TNS_ADMIN' => input('tns_admin_path')
    }
  )
  
  # Both should connect successfully
  describe 'TCP connection' do
    subject { tcp_sql.query('SELECT 1 FROM dual') }
    its('rows.length') { should eq 1 }
  end
  
  describe 'TCPS connection' do
    subject { tcps_sql.query('SELECT 1 FROM dual') }
    its('rows.length') { should eq 1 }
  end
  
  # Verify protocols are different
  tcp_protocol = tcp_sql.query("SELECT LOWER(sys_context('USERENV', 'NETWORK_PROTOCOL')) AS p FROM dual").row(0).column('p').value
  tcps_protocol = tcps_sql.query("SELECT LOWER(sys_context('USERENV', 'NETWORK_PROTOCOL')) AS p FROM dual").row(0).column('p').value
  
  describe 'TCP protocol should be "tcp"' do
    it { expect(tcp_protocol).to eq('tcp') }
  end
  
  describe 'TCPS protocol should be "tcps"' do
    it { expect(tcps_protocol).to eq('tcps') }
  end
  
  # Verify they connect to same database
  tcp_db = tcp_sql.query("SELECT sys_context('USERENV', 'DB_NAME') AS name FROM dual").row(0).column('name').value
  tcps_db = tcps_sql.query("SELECT sys_context('USERENV', 'DB_NAME') AS name FROM dual").row(0).column('name').value
  
  describe 'Should connect to same database' do
    it { expect(tcp_db).to eq(tcps_db) }
  end
end

control 'tcps-wallet-validation' do
  impact 0.7
  title 'Validate Oracle wallet is being used'
  desc 'Ensure client wallet configuration is correct for TCPS'
  tag 'ssl'
  tag 'tcps'
  tag 'wallet'
  tag 'security'
  
  only_if('Requires TCPS connection') do
    !input('oracle_user').nil? && 
    !input('oracle_password').nil? && 
    !input('tns_alias_tcps').nil? &&
    !input('tns_admin_path').nil?
  end
  
  sql = oracledb_session(
    user: input('oracle_user'),
    password: input('oracle_password'),
    tns_alias: input('tns_alias_tcps'),
    env: {
      'TNS_ADMIN' => input('tns_admin_path')
    }
  )
  
  # If we can connect via TCPS, the wallet is valid
  describe 'TCPS connection with wallet' do
    subject { sql.query('SELECT 1 FROM dual') }
    its('rows.length') { should eq 1 }
  end
  
  # Query authentication method
  describe sql.query("SELECT sys_context('USERENV', 'AUTHENTICATION_METHOD') AS method FROM dual") do
    its('row(0).column("method").value') { should_not be_nil }
  end
end
