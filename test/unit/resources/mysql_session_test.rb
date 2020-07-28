require "helper"
require "inspec/resource"
require "inspec/resources/mysql_session"
require "inspec/resources/command"

describe "Inspec::Resources::MysqlSession" do
  it "verify mysql_session escaped login details with single quotes correctly" do
    resource = load_resource("mysql_session",
                             "root",
                             %q{'%"'"&^*&()'*%})

    _(resource.send(:create_mysql_cmd, "SELECT 1 FROM DUAL;"))
      .must_equal(%q{mysql -uroot -p\'\%\"\'\"\&\^\*\&\(\)\'\*\% -h localhost -s -e "SELECT 1 FROM DUAL;"})
  end
  it "verify mysql_session omits optional username and password" do
    resource = load_resource("mysql_session")

    _(resource.send(:create_mysql_cmd, "SELECT 1 FROM DUAL;"))
      .must_equal('mysql -h localhost -s -e "SELECT 1 FROM DUAL;"')
  end
  it "verify mysql_session redacts output" do
    cmd = %q{mysql -uroot -p\'\%\"\'\"\&\^\*\&\(\)\'\*\% -h localhost -s -e "SELECT 1 FROM DUAL;"}
    options = { redact_regex: /(mysql -u\w+ -p).+(\s-(h|S).*)/ }
    resource = load_resource("command", cmd, options)

    expected_to_s = %q{Command: `mysql -uroot -pREDACTED -h localhost -s -e "SELECT 1 FROM DUAL;"`}
    _(resource.to_s).must_equal(expected_to_s)
  end
end
