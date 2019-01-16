fixtures = {}
%w{
log_metric_filter_1_name
log_metric_filter_1_log_group_name
log_metric_filter_1_metric_name
log_metric_filter_2_name
log_metric_filter_2_log_group_name
log_metric_filter_2_pattern
}.each do |fixture_name|
  fixtures[fixture_name] = attribute(
  fixture_name,
  default: "default.#{fixture_name}",
  description: "See ../build/cloudwatch.tf"
  )
end

#----------------------- Recall -----------------------#

control "aws_cloudwatch_log_metric_filter recall" do
  describe aws_cloudwatch_log_metric_filter(
    filter_name: fixtures["log_metric_filter_1_name"],
    log_group_name: fixtures["log_metric_filter_1_log_group_name"]
  ) do
    it { should exist }
  end

  describe aws_cloudwatch_log_metric_filter(
    pattern: fixtures["log_metric_filter_2_pattern"]
  ) do
    it { should exist }
  end
end

#----------------------- pattern property -----------------------#

control "aws_cloudwatch_log_metric_filter pattern property" do
  describe aws_cloudwatch_log_metric_filter(
    filter_name: fixtures["log_metric_filter_1_name"],
    log_group_name: fixtures["log_metric_filter_1_log_group_name"]
  ) do
    its("pattern") { should cmp "testpattern01" }
  end
end

#----------------------- metric_name property -----------------------#
control "aws_cloudwatch_log_metric_filter metric_name property" do
  describe aws_cloudwatch_log_metric_filter(
    filter_name: fixtures["log_metric_filter_1_name"],
    log_group_name: fixtures["log_metric_filter_1_log_group_name"]
  ) do
    its("metric_name") { should cmp fixtures["log_metric_filter_1_metric_name"] }
  end
end

#----------------------- log_group_name property -----------------------#
control "aws_cloudwatch_log_metric_filter log_group_name property" do
  describe aws_cloudwatch_log_metric_filter(
    filter_name: fixtures["log_metric_filter_2_name"],
    log_group_name: fixtures["log_metric_filter_2_log_group_name"]
  ) do
    its("log_group_name") { should cmp fixtures["log_metric_filter_2_log_group_name"] }
  end
end

#----------------------- filter_name property -----------------------#
control "aws_cloudwatch_log_metric_filter filter_name property" do
  describe aws_cloudwatch_log_metric_filter(
    filter_name: fixtures["log_metric_filter_2_name"],
    log_group_name: fixtures["log_metric_filter_2_log_group_name"]
  ) do
    its("filter_name") { should cmp fixtures["log_metric_filter_2_name"] }
  end
end
