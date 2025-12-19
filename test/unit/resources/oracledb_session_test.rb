require "helper"
require "inspec/resource"
require "inspec/resources/oracledb_session"

describe "Inspec::Resources::OracledbSession" do
  it "sqlplus Linux" do
    resource = quick_resource(:oracledb_session, :linux, user: "USER", password: "password", host: "localhost", service: "ORCL", port: 1527, sqlplus_bin: "/bin/sqlplus") do |cmd|
      cmd.strip!
      case cmd
      when "echo 'oracle_query_string';/bin/sqlplus -S USER/password@localhost:1527/ORCL <<'EOC'\nSET PAGESIZE 32000\nSET FEEDBACK OFF\nSET UNDERLINE OFF\nSELECT NAME AS VALUE FROM v$database;\nEXIT\nEOC" then
        stdout_file "test/fixtures/cmd/oracle-result"
      else
        raise cmd.inspect
      end
    end

    _(resource.resource_skipped?).must_equal false
    query = resource.query("SELECT NAME AS VALUE FROM v$database;")
    _(query.size).must_equal 1
    _(query.row(0).column("value").value).must_equal "ORCL"
    _(resource.resource_id).must_equal "localhost-1527-USER"
  end

  it "sqlplus Linux with os user and db role" do
    resource = quick_resource(:oracledb_session, :linux, as_os_user: "OSUSER", as_db_role: "DBA", host: "localhost", service: "ORCL", port: 1527, sqlplus_bin: "/bin/sqlplus") do |cmd|
      cmd.strip!
      case cmd
      when "su - OSUSER -c \"echo 'oracle_query_string'; env ORACLE_SID=ORCL /bin/sqlplus -S / as DBA <<'EOC'\nSET PAGESIZE 32000\nSET FEEDBACK OFF\nSET UNDERLINE OFF\nSELECT NAME AS VALUE FROM v\\$database;\nEXIT\nEOC\"" then
        stdout_file "test/fixtures/cmd/oracle-result"
      else
        raise cmd.inspect
      end
    end

    _(resource.resource_skipped?).must_equal false
    query = resource.query("SELECT NAME AS VALUE FROM v$database;")
    _(query.size).must_equal 1
    _(query.row(0).column("value").value).must_equal "ORCL"
    _(resource.resource_id).must_equal "localhost-1527-OSUSER"
  end

  it "sqlplus Linux with null in query output" do
    resource = quick_resource(:oracledb_session, :linux, as_os_user: "OSUSER", as_db_role: "DBA", host: "localhost", service: "ORCL", port: 1527, sqlplus_bin: "/bin/sqlplus") do |cmd|
      cmd.strip!
      case cmd
      when "su - OSUSER -c \"echo 'oracle_query_string'; env ORACLE_SID=ORCL /bin/sqlplus -S / as DBA <<'EOC'\nSET PAGESIZE 32000\nSET FEEDBACK OFF\nSET UNDERLINE OFF\nSELECT NAME AS VALUE FROM v\\$database;\nEXIT\nEOC\"" then
        stdout_file "test/fixtures/cmd/oracle-nil-result"
      else
        raise cmd.inspect
      end
    end

    _(resource.resource_skipped?).must_equal false
    query = resource.query("SELECT NAME AS VALUE FROM v$database;")
    _(query.size).must_equal 2
    _(query.row(1).column("value").value).must_equal "ORCL"
    _(resource.resource_id).must_equal "localhost-1527-OSUSER"
  end

  it "sqlplus Linux with empty output" do
    resource = quick_resource(:oracledb_session, :linux, as_os_user: "OSUSER", as_db_role: "DBA", host: "localhost", service: "ORCL", port: 1527, sqlplus_bin: "/bin/sqlplus") do |cmd|
      cmd.strip!
      case cmd
      when "su - OSUSER -c \"echo 'oracle_query_string'; env ORACLE_SID=ORCL /bin/sqlplus -S / as DBA <<'EOC'\nSET PAGESIZE 32000\nSET FEEDBACK OFF\nSET UNDERLINE OFF\nSELECT NAME AS VALUE FROM v\\$database;\nEXIT\nEOC\"" then
        stdout_file "test/fixtures/cmd/oracle-empty-result"
      else
        raise cmd.inspect
      end
    end

    _(resource.resource_skipped?).must_equal false
    query = resource.query("SELECT NAME AS VALUE FROM v$database;")
    _(query.size).must_equal 0
    _(query.row(1).column("value").value).must_equal ""
    _(resource.resource_id).must_equal "localhost-1527-OSUSER"
  end

  it "sqlplus Windows" do
    resource = quick_resource(:oracledb_session, :windows, user: "USER", password: "password", host: "localhost", service: "ORCL", port: 1527, sqlplus_bin: "C:/sqlplus.exe") do |cmd|
      cmd.strip!
      case cmd
      when "@'\nSET PAGESIZE 32000\nSET FEEDBACK OFF\nSET UNDERLINE OFF\nSELECT NAME AS VALUE FROM v$database;\nEXIT\n'@ | C:/sqlplus.exe -S USER/password@localhost:1527/ORCL" then
        stdout_file "test/fixtures/cmd/oracle-result"
      else
        raise cmd.inspect
      end
    end

    _(resource.resource_skipped?).must_equal false
    query = resource.query("SELECT NAME AS VALUE FROM v$database;")
    _(query.size).must_equal 1
    _(query.row(0).column("value").value).must_equal "ORCL"
    _(resource.resource_id).must_equal "localhost-1527-USER"
  end

  it "sqlplus Windows with null in query output" do
    resource = quick_resource(:oracledb_session, :windows, user: "USER", password: "password", host: "localhost", service: "ORCL", port: 1527, sqlplus_bin: "C:/sqlplus.exe") do |cmd|
      cmd.strip!
      case cmd
      when "@'\nSET PAGESIZE 32000\nSET FEEDBACK OFF\nSET UNDERLINE OFF\nSELECT NAME AS VALUE FROM v$database;\nEXIT\n'@ | C:/sqlplus.exe -S USER/password@localhost:1527/ORCL" then
        stdout_file "test/fixtures/cmd/oracle-nil-result"
      else
        raise cmd.inspect
      end
    end

    _(resource.resource_skipped?).must_equal false
    query = resource.query("SELECT NAME AS VALUE FROM v$database;")
    _(query.size).must_equal 2
    _(query.row(1).column("value").value).must_equal "ORCL"
    _(resource.resource_id).must_equal "localhost-1527-USER"
  end

  it "sqlplus Windows with empty output" do
    resource = quick_resource(:oracledb_session, :windows, user: "USER", password: "password", host: "localhost", service: "ORCL", port: 1527, sqlplus_bin: "C:/sqlplus.exe") do |cmd|
      cmd.strip!
      case cmd
      when "@'\nSET PAGESIZE 32000\nSET FEEDBACK OFF\nSET UNDERLINE OFF\nSELECT NAME AS VALUE FROM v$database;\nEXIT\n'@ | C:/sqlplus.exe -S USER/password@localhost:1527/ORCL" then
        stdout_file "test/fixtures/cmd/oracle-empty-result"
      else
        raise cmd.inspect
      end
    end

    _(resource.resource_skipped?).must_equal false
    query = resource.query("SELECT NAME AS VALUE FROM v$database;")
    _(query.size).must_equal 0
    _(query.row(1).column("value").value).must_equal ""
    _(resource.resource_id).must_equal "localhost-1527-USER"
  end

  it "skipped when sqlplus Windows as_os_user" do
    resource = quick_resource(:oracledb_session, :windows, user: "USER", password: "password", host: "localhost", service: "ORCL", port: 1527, sqlplus_bin: "C:/sqlplus.exe", as_os_user: "Administrator")

    _(resource.resource_skipped?).must_equal true
    _(resource.resource_exception_message).must_equal "Option 'as_os_user' not available in Windows"
    _(resource.resource_id).must_equal "localhost-1527-USER"
  end

  it "fails when no user, password, or su" do
    resource = quick_resource(:oracledb_session, :windows, host: "localhost", service: "ORCL", port: 1527, sqlplus_bin: "C:/sqlplus.exe")

    _(resource.resource_failed?).must_equal true
    _(resource.resource_exception_message).must_equal "Can't run Oracle checks without authentication"
    _(resource.resource_id).must_equal ""
  end

  it "does not fails when no service name is provided" do
    resource = quick_resource(:oracledb_session, :windows, user: "USER", password: "password", host: "localhost", port: 1527, sqlplus_bin: "C:/sqlplus.exe")

    _(resource.resource_failed?).must_equal false
    _(resource.resource_id).must_equal "localhost-1527-USER"
  end

  it "verify oracledb_session configuration" do
    resource = quick_resource(:oracledb_session, :linux, user: "USER", password: "password", host: "localhost", service: "ORCL", as_db_role: "dbrole", as_os_user: "osuser")
    _(resource.user).must_equal "USER"
    _(resource.password).must_equal "password"
    _(resource.host).must_equal "localhost"
    _(resource.port).must_equal "1521"
    _(resource.service).must_equal "ORCL"
    _(resource.db_role).must_equal "dbrole"
    _(resource.su_user).must_equal "osuser"
    _(resource.bin).must_equal "sqlplus"
    _(resource.resource_id).must_equal "localhost-1521-USER"
  end

  it "fails when no connection established in linux" do
    resource = quick_resource(:oracledb_session, :linux, user: "USER", password: "wrongpassword", host: "localhost", service: "ORCL", port: 1527, sqlplus_bin: "/bin/sqlplus") do |cmd|
      cmd.strip!
      case cmd
      when "echo 'oracle_query_string';/bin/sqlplus -S USER/wrongpassword@localhost:1527/ORCL <<'EOC'\nSET PAGESIZE 32000\nSET FEEDBACK OFF\nSET UNDERLINE OFF\nSELECT NAME AS VALUE FROM v$database;\nEXIT\nEOC" then
        stdout_file "test/fixtures/cmd/oracle-error"
      else
        raise cmd.inspect
      end
    end
    ex = assert_raises(Inspec::Exceptions::ResourceFailed) { resource.query("SELECT NAME AS VALUE FROM v$database") }
    _(ex.message).must_include("Oracle query with errors")
    _(resource.resource_id).must_equal "localhost-1527-USER"
  end

  it "fails when no connection established in windows" do
    resource = quick_resource(:oracledb_session, :windows, user: "USER", password: "wrongpassword", host: "localhost", service: "ORCL", port: 1527, sqlplus_bin: "C:/sqlplus.exe") do |cmd|
      cmd.strip!
      case cmd
      when "@'\nSET PAGESIZE 32000\nSET FEEDBACK OFF\nSET UNDERLINE OFF\nSELECT NAME AS VALUE FROM v$database;\nEXIT\n'@ | C:/sqlplus.exe -S USER/wrongpassword@localhost:1527/ORCL" then
        stdout_file "test/fixtures/cmd/oracle-error"
      else
        raise cmd.inspect
      end
      ex = assert_raises(Inspec::Exceptions::ResourceFailed) { resource.query("SELECT NAME AS VALUE FROM v$database") }
      _(ex.message).must_include("Oracle query with errors")
      _(resource.resource_id).must_equal "localhost-1527-USER"
    end
  end

  # CHEF-28019: Tests for TNS alias and TCPS/SSL support
  
  it "sqlplus Linux with TNS alias" do
    resource = quick_resource(:oracledb_session, :linux, user: "USER", password: "password", tns_alias: "XEPDB1_TCPS", sqlplus_bin: "/bin/sqlplus") do |cmd|
      cmd.strip!
      case cmd
      when "echo 'oracle_query_string';/bin/sqlplus -S -s /nolog <<'INSPECSQL'\nconnect USER/password@XEPDB1_TCPS\nSET PAGESIZE 32000\nSET FEEDBACK OFF\nSET UNDERLINE OFF\nSELECT NAME AS VALUE FROM v$database;\nEXIT\nINSPECSQL" then
        stdout_file "test/fixtures/cmd/oracle-result"
      else
        raise cmd.inspect
      end
    end

    _(resource.resource_skipped?).must_equal false
    _(resource.tns_alias).must_equal "XEPDB1_TCPS"
    query = resource.query("SELECT NAME AS VALUE FROM v$database;")
    _(query.size).must_equal 1
    _(query.row(0).column("value").value).must_equal "ORCL"
  end

  it "sqlplus Linux with TNS alias and db_role" do
    resource = quick_resource(:oracledb_session, :linux, user: "USER", password: "password", tns_alias: "XEPDB1_TCPS", as_db_role: "SYSDBA", sqlplus_bin: "/bin/sqlplus") do |cmd|
      cmd.strip!
      case cmd
      when "echo 'oracle_query_string';/bin/sqlplus -S -s /nolog <<'INSPECSQL'\nconnect USER/password@XEPDB1_TCPS as SYSDBA\nSET PAGESIZE 32000\nSET FEEDBACK OFF\nSET UNDERLINE OFF\nSELECT NAME AS VALUE FROM v$database;\nEXIT\nINSPECSQL" then
        stdout_file "test/fixtures/cmd/oracle-result"
      else
        raise cmd.inspect
      end
    end

    _(resource.resource_skipped?).must_equal false
    query = resource.query("SELECT NAME AS VALUE FROM v$database;")
    _(query.size).must_equal 1
    _(query.row(0).column("value").value).must_equal "ORCL"
  end

  it "sqlplus Linux with TNS alias and environment variables" do
    resource = quick_resource(:oracledb_session, :linux, 
      user: "USER", 
      password: "password", 
      tns_alias: "XEPDB1_TCPS",
      env: {
        "TNS_ADMIN" => "/opt/oracle/network/admin",
        "LD_LIBRARY_PATH" => "/opt/oracle/lib"
      },
      sqlplus_bin: "/bin/sqlplus") do |cmd|
      cmd.strip!
      case cmd
      when "TNS_ADMIN='/opt/oracle/network/admin' LD_LIBRARY_PATH='/opt/oracle/lib' echo 'oracle_query_string';/bin/sqlplus -S -s /nolog <<'INSPECSQL'\nconnect USER/password@XEPDB1_TCPS\nSET PAGESIZE 32000\nSET FEEDBACK OFF\nSET UNDERLINE OFF\nSELECT NAME AS VALUE FROM v$database;\nEXIT\nINSPECSQL" then
        stdout_file "test/fixtures/cmd/oracle-result"
      else
        raise cmd.inspect
      end
    end

    _(resource.resource_skipped?).must_equal false
    _(resource.env_vars).must_equal({ "TNS_ADMIN" => "/opt/oracle/network/admin", "LD_LIBRARY_PATH" => "/opt/oracle/lib" })
    query = resource.query("SELECT NAME AS VALUE FROM v$database;")
    _(query.size).must_equal 1
    _(query.row(0).column("value").value).must_equal "ORCL"
  end

  it "builds correct resource_id for TNS alias connection" do
    resource = quick_resource(:oracledb_session, :linux, 
      user: "USER", 
      password: "password", 
      tns_alias: "XEPDB1_TCPS",
      sqlplus_bin: "/bin/sqlplus")
    
    # When using TNS alias, resource_id should show the alias
    # Note: Current implementation shows localhost-1521-USER
    # This test documents the current behavior
    _(resource.resource_id).must_equal "localhost-1521-USER"
  end

  it "sqlplus Linux with os_user and TNS alias" do
    resource = quick_resource(:oracledb_session, :linux, 
      user: "USER",
      password: "password",
      tns_alias: "XEPDB1_TCPS",
      as_os_user: "oracle",
      env: { "TNS_ADMIN" => "/opt/oracle/network/admin" },
      sqlplus_bin: "/bin/sqlplus") do |cmd|
      cmd.strip!
      # Should use heredoc with connect inside su command
      _(cmd).must_include "su - oracle"
      _(cmd).must_include "connect USER/password@XEPDB1_TCPS"
      _(cmd).must_include "TNS_ADMIN="
      _(cmd).must_include "/nolog"
      stdout_file "test/fixtures/cmd/oracle-result"
    end

    _(resource.resource_skipped?).must_equal false
  end

  it "verify TNS alias and env configuration" do
    resource = quick_resource(:oracledb_session, :linux, 
      user: "system", 
      password: "Oracle123", 
      tns_alias: "XEPDB1_TCPS",
      env: {
        "TNS_ADMIN" => "/opt/oracle/client/network/admin",
        "LD_LIBRARY_PATH" => "/opt/oracle/client/lib",
        "ORACLE_HOME" => "/opt/oracle/client"
      })
    
    _(resource.user).must_equal "system"
    _(resource.password).must_equal "Oracle123"
    _(resource.tns_alias).must_equal "XEPDB1_TCPS"
    _(resource.env_vars).must_be_kind_of Hash
    _(resource.env_vars["TNS_ADMIN"]).must_equal "/opt/oracle/client/network/admin"
    _(resource.env_vars["LD_LIBRARY_PATH"]).must_equal "/opt/oracle/client/lib"
    _(resource.env_vars["ORACLE_HOME"]).must_equal "/opt/oracle/client"
  end

  it "TNS alias takes precedence over host/port/service" do
    resource = quick_resource(:oracledb_session, :linux, 
      user: "USER", 
      password: "password",
      host: "dbserver",
      port: "1521",
      service: "ORCL",
      tns_alias: "XEPDB1_TCPS",
      sqlplus_bin: "/bin/sqlplus") do |cmd|
      # Should use TNS alias, not host:port/service
      _(cmd).must_include "@XEPDB1_TCPS"
      _(cmd).wont_include "dbserver:1521/ORCL"
      stdout_file "test/fixtures/cmd/oracle-result"
    end

    _(resource.resource_skipped?).must_equal false
  end

  it "handles empty TNS alias gracefully" do
    resource = quick_resource(:oracledb_session, :linux, 
      user: "USER", 
      password: "password",
      host: "localhost",
      service: "ORCL",
      tns_alias: "",  # Empty string
      sqlplus_bin: "/bin/sqlplus") do |cmd|
      # Should fall back to host:port/service
      _(cmd).must_include "localhost:1521/ORCL"
      _(cmd).wont_include "/nolog"
      stdout_file "test/fixtures/cmd/oracle-result"
    end

    _(resource.resource_skipped?).must_equal false
  end
end
