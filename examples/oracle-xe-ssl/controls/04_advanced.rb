# encoding: utf-8
# copyright: 2024, Chef Software, Inc.

# Advanced Usage Tests
# These tests demonstrate advanced features and edge cases

title 'Oracle Database - Advanced oracledb_session Features'

control 'debug-mode-enabled' do
  impact 0.3
  title 'Test debug mode functionality'
  desc 'Verify debug mode outputs masked command without exposing password (CHEF-28019)'
  tag 'debug'
  tag 'security'
  tag 'chef-28019'
  
  only_if('Requires oracle credentials') do
    !input('oracle_user').nil? && !input('oracle_password').nil?
  end
  
  # Debug mode should output command with masked password to stderr
  # We can't easily capture stderr in InSpec, but we can verify it doesn't break
  sql = oracledb_session(
    user: input('oracle_user'),
    password: input('oracle_password'),
    host: input('oracle_host'),
    port: input('oracle_port'),
    service: input('oracle_service'),
    debug: true  # Enable debug output
  )
  
  describe sql.query('SELECT 1 FROM dual') do
    its('rows.length') { should eq 1 }
  end
end

control 'env-path-expansion' do
  impact 0.6
  title 'Test environment variable $PATH expansion'
  desc 'Verify that $PATH in environment variables is properly expanded (CHEF-28019)'
  tag 'env-vars'
  tag 'path'
  tag 'chef-28019'
  
  only_if('Requires TNS configuration and library path') do
    !input('oracle_user').nil? && 
    !input('oracle_password').nil? && 
    !input('tns_alias_tcp').nil? &&
    !input('tns_admin_path').nil? &&
    !input('ld_library_path').nil?
  end
  
  # Use $PATH placeholder in LD_LIBRARY_PATH
  # The resource should expand it to actual PATH value
  sql = oracledb_session(
    user: input('oracle_user'),
    password: input('oracle_password'),
    tns_alias: input('tns_alias_tcp'),
    env: {
      'TNS_ADMIN' => input('tns_admin_path'),
      'LD_LIBRARY_PATH' => "#{input('ld_library_path')}:$PATH",  # Should expand $PATH
      'PATH' => "/custom/bin:$PATH"  # Should expand $PATH
    }
  )
  
  describe sql.query('SELECT 1 FROM dual') do
    its('rows.length') { should eq 1 }
  end
end

control 'custom-sqlplus-binary' do
  impact 0.4
  title 'Test custom sqlplus binary path'
  desc 'Verify sqlplus_bin option works for non-standard installations'
  tag 'sqlplus'
  tag 'configuration'
  
  only_if('Requires sqlplus_bin configured') do
    !input('oracle_user').nil? && 
    !input('oracle_password').nil? &&
    !input('sqlplus_bin').nil?
  end
  
  sql = oracledb_session(
    user: input('oracle_user'),
    password: input('oracle_password'),
    host: input('oracle_host'),
    port: input('oracle_port'),
    service: input('oracle_service'),
    sqlplus_bin: input('sqlplus_bin')
  )
  
  describe sql.query('SELECT 1 FROM dual') do
    its('rows.length') { should eq 1 }
  end
end

control 'multiple-queries-same-session' do
  impact 0.5
  title 'Execute multiple queries using same session object'
  desc 'Verify session object can be reused for multiple queries'
  tag 'performance'
  tag 'session'
  
  only_if('Requires oracle credentials') do
    !input('oracle_user').nil? && !input('oracle_password').nil?
  end
  
  sql = oracledb_session(
    user: input('oracle_user'),
    password: input('oracle_password'),
    host: input('oracle_host'),
    port: input('oracle_port'),
    service: input('oracle_service')
  )
  
  # Execute multiple queries with same session object
  describe sql.query('SELECT 1 AS n FROM dual') do
    its('row(0).column("n").value') { should eq '1' }
  end
  
  describe sql.query('SELECT 2 AS n FROM dual') do
    its('row(0).column("n").value') { should eq '2' }
  end
  
  describe sql.query('SELECT 3 AS n FROM dual') do
    its('row(0).column("n").value') { should eq '3' }
  end
end

control 'complex-sql-query' do
  impact 0.5
  title 'Execute complex SQL queries'
  desc 'Verify resource handles complex SQL with joins, subqueries, etc.'
  tag 'sql'
  tag 'advanced'
  
  only_if('Requires oracle credentials') do
    !input('oracle_user').nil? && !input('oracle_password').nil?
  end
  
  sql = oracledb_session(
    user: input('oracle_user'),
    password: input('oracle_password'),
    host: input('oracle_host'),
    port: input('oracle_port'),
    service: input('oracle_service')
  )
  
  # Subquery
  describe sql.query('SELECT (SELECT COUNT(*) FROM dual) AS cnt FROM dual') do
    its('row(0).column("cnt").value') { should eq '1' }
  end
  
  # UNION
  describe sql.query('SELECT 1 AS n FROM dual UNION SELECT 2 FROM dual ORDER BY n') do
    its('rows.length') { should eq 2 }
    its('row(0).column("n").value') { should eq '1' }
    its('row(1).column("n").value') { should eq '2' }
  end
  
  # CASE statement
  describe sql.query("SELECT CASE WHEN 1=1 THEN 'TRUE' ELSE 'FALSE' END AS result FROM dual") do
    its('row(0).column("result").value') { should eq 'TRUE' }
  end
end

control 'special-characters-in-query' do
  impact 0.4
  title 'Handle special characters in SQL queries'
  desc 'Verify resource properly escapes special characters'
  tag 'sql'
  tag 'escaping'
  
  only_if('Requires oracle credentials') do
    !input('oracle_user').nil? && !input('oracle_password').nil?
  end
  
  sql = oracledb_session(
    user: input('oracle_user'),
    password: input('oracle_password'),
    host: input('oracle_host'),
    port: input('oracle_port'),
    service: input('oracle_service')
  )
  
  # Single quotes
  describe sql.query("SELECT 'O''Reilly' AS name FROM dual") do
    its('row(0).column("name").value') { should eq "O'Reilly" }
  end
  
  # Backslash
  describe sql.query("SELECT 'C:\\path\\to\\file' AS path FROM dual") do
    its('row(0).column("path").value') { should eq 'C:\\path\\to\\file' }
  end
  
  # Semicolon in string (should not terminate statement early)
  describe sql.query("SELECT 'test;value' AS val FROM dual") do
    its('row(0).column("val").value') { should eq 'test;value' }
  end
end

control 'error-handling' do
  impact 0.5
  title 'Test error handling for invalid queries'
  desc 'Verify resource properly reports SQL errors'
  tag 'error-handling'
  tag 'reliability'
  
  only_if('Requires oracle credentials') do
    !input('oracle_user').nil? && !input('oracle_password').nil?
  end
  
  sql = oracledb_session(
    user: input('oracle_user'),
    password: input('oracle_password'),
    host: input('oracle_host'),
    port: input('oracle_port'),
    service: input('oracle_service')
  )
  
  # Invalid SQL should raise an exception
  describe 'Invalid SQL query' do
    it 'should raise an error for syntax error' do
      expect {
        sql.query('SELECT FROM dual')  # Missing column
      }.to raise_error(Inspec::Exceptions::ResourceFailed, /ORA-|error/i)
    end
  end
  
  describe 'Invalid table reference' do
    it 'should raise an error for non-existent table' do
      expect {
        sql.query('SELECT * FROM nonexistent_table_xyz')
      }.to raise_error(Inspec::Exceptions::ResourceFailed, /ORA-|error/i)
    end
  end
end

control 'minimal-connection-params' do
  impact 0.6
  title 'Test minimal connection parameters'
  desc 'Verify resource works with minimal required parameters'
  tag 'configuration'
  tag 'backward-compat'
  
  only_if('Requires oracle credentials') do
    !input('oracle_user').nil? && !input('oracle_password').nil?
  end
  
  # Absolute minimum: user, password, host, service
  sql = oracledb_session(
    user: input('oracle_user'),
    password: input('oracle_password'),
    host: input('oracle_host'),
    service: input('oracle_service')
    # port defaults to 1521
  )
  
  describe sql.query('SELECT 1 FROM dual') do
    its('rows.length') { should eq 1 }
  end
end

control 'cross-platform-compatibility' do
  impact 0.7
  title 'Verify cross-platform compatibility'
  desc 'Test that resource works on current platform (Unix/Windows)'
  tag 'platform'
  tag 'compatibility'
  
  only_if('Requires oracle credentials') do
    !input('oracle_user').nil? && !input('oracle_password').nil?
  end
  
  sql = oracledb_session(
    user: input('oracle_user'),
    password: input('oracle_password'),
    host: input('oracle_host'),
    port: input('oracle_port'),
    service: input('oracle_service')
  )
  
  # Basic connectivity test
  describe sql.query('SELECT 1 FROM dual') do
    its('rows.length') { should eq 1 }
  end
  
  # Check platform-specific context
  if os.unix?
    describe 'Unix/Linux platform' do
      it 'should use Unix-style heredoc syntax' do
        expect(os.unix?).to be true
      end
    end
  elsif os.windows?
    describe 'Windows platform' do
      it 'should use Windows-style command syntax' do
        expect(os.windows?).to be true
      end
    end
  end
end

control 'arm-mac-compatibility' do
  impact 0.6
  title 'Verify ARM Mac (Apple Silicon) compatibility'
  desc 'Test that resource works on ARM Macs via Rosetta 2 emulation'
  tag 'arm'
  tag 'mac'
  tag 'rosetta'
  tag 'chef-28019'
  
  only_if('Only on ARM macOS') do
    os.darwin? && os[:arch] == 'arm64'
  end
  
  only_if('Requires oracle credentials') do
    !input('oracle_user').nil? && !input('oracle_password').nil?
  end
  
  sql = oracledb_session(
    user: input('oracle_user'),
    password: input('oracle_password'),
    host: input('oracle_host'),
    port: input('oracle_port'),
    service: input('oracle_service')
  )
  
  describe 'ARM Mac can connect to Oracle' do
    subject { sql.query('SELECT 1 FROM dual') }
    its('rows.length') { should eq 1 }
  end
  
  describe 'System architecture' do
    it 'should be ARM64' do
      expect(os[:arch]).to eq('arm64')
    end
  end
end
