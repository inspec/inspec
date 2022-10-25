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
end
