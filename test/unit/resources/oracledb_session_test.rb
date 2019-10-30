require "helper"
require "inspec/resource"
require "inspec/resources/oracledb_session"

describe "Inspec::Resources::OracledbSession" do
  it "Linux" do
    resource = quick_resource(:oracledb_session, :linux, user: "USER", password: "password", host: "localhost", service: "ORCL", port: 1527, sqlplus_bin: "/bin/sqlplus") do |cmd|
      cmd.strip!
      case cmd
      when "/bin/sqlplus -S \"USER\"/\"password\"@localhost:1527/ORCL <<'EOC'\nSET MARKUP HTML ON\nSET PAGESIZE 32000\nSET FEEDBACK OFF\nSELECT NAME AS VALUE FROM v$database;\nEXIT\nEOC" then
        stdout_file "test/unit/mock/cmd/oracle-result"
      else
        raise cmd.inspect
      end
    end

    query = resource.query("SELECT NAME AS VALUE FROM v$database;")
    _(query.size).must_equal 1
    _(query.row(0).column("value").value).must_equal "ORCL"
  end

  it "Windows" do
    resource = quick_resource(:oracledb_session, :windows, user: "USER", password: "password", host: "localhost", service: "ORCL", port: 1527, sqlplus_bin: "C:/sqlplus.exe") do |cmd|
      cmd.strip!
      case cmd
      when "@'\nSET MARKUP HTML ON\nSET PAGESIZE 32000\nSET FEEDBACK OFF\nSELECT NAME AS VALUE FROM v$database;\nEXIT\n'@ | C:/sqlplus.exe -S \"USER\"/\"password\"@localhost:1527/ORCL" then
        stdout_file "test/unit/mock/cmd/oracle-result"
      else
        raise cmd.inspect
      end
    end

    query = resource.query("SELECT NAME AS VALUE FROM v$database;")
    _(query.size).must_equal 1
    _(query.row(0).column("value").value).must_equal "ORCL"
  end

  it "verify oracledb_session configuration" do
    resource = load_resource("oracledb_session", user: "SYSTEM", password: "supersecurepass", host: "localhost", service: "ORCL.localdomain")
    _(resource.user).must_equal "SYSTEM"
    _(resource.password).must_equal "supersecurepass"
    _(resource.host).must_equal "localhost"
    _(resource.service).must_equal "ORCL.localdomain"
  end

  it "run a SQL query" do
    resource = load_resource("oracledb_session", user: "SYSTEM", password: "supersecurepass", host: "127.0.0.1", service: "ORCL.localdomain", port: 1527)
    query = resource.query("SELECT NAME AS VALUE FROM v$database;")
    _(query.size).must_equal 1
    _(query.row(0).column("value").value).must_equal "ORCL"
  end
end
