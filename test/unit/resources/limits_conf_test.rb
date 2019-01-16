# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require "helper"
require "inspec/resource"

describe "Inspec::Resources::LimitsConf" do
  it "verify limits.conf config parsing" do
    resource = load_resource("limits_conf")
    _(resource.send("*")).must_equal [%w{soft core 0}, %w{hard rss 10000}]
    _(resource.send("ftp")).must_equal [%w{hard nproc 0}]
  end
end
