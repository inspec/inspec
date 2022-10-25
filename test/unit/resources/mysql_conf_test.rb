require "helper"
require "inspec/resource"
require "inspec/resources/mysql_conf"

describe "Inspec::Resources::MysqlConf" do
  it "generates the resource_id for current resource" do
    resource = load_resource("mysql_conf", "/etc/mysql/my.cnf")
    _(resource.resource_id).must_equal "/etc/mysql/my.cnf"
  end

  it "verify mysql.conf config parsing" do
    resource = load_resource("mysql_conf", "/etc/mysql/my.cnf")
    _(resource.client["port"]).must_equal "3306"
    _(resource.mysqld["user"]).must_equal "mysql"
    _(resource.mysqld["key_buffer_size"]).must_equal "16M"
  end
end
