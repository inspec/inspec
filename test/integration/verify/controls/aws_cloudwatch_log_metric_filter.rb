lmf_1_name = attribute(
  'lmf_1_name',
  default: 'default.lmf_1_name',
  description: 'Name of a Cloudwatch Log Metric Filter',
)

lmf_2_name = attribute(
  'lmf_2_name',
  default: 'default.lmf_2_name',
  description: 'Name of a Cloudwatch Log Metric Filter',
)

lmf_lg_1_name = attribute(
  'lmf_lg_1_name',
  default: 'default.lmf_lg_1_name',
  description: 'Name of a Cloudwatch Log Group',
)

lmf_lg_2_name = attribute(
  'lmf_lg_2_name',
  default: 'default.lmf_lg_2_name',
  description: 'Name of a Cloudwatch Log Group',
)

lmf_1_metric_1_name = attribute(
  'lmf_1_metric_1_name',
  default: 'default.lmf_1_metric_1_name',
  description: 'Name of a Cloudwatch Metric',
)

describe aws_cloudwatch_log_metric_filter(
  filter_name: lmf_1_name,
  log_group_name: lmf_lg_1_name,
) do
  it { should exist }
  its('pattern') { should cmp 'testpattern01'}
  its('metric_name') { should cmp lmf_1_metric_1_name }
end

describe aws_cloudwatch_log_metric_filter(
  pattern: 'testpattern02',
) do
  it { should exist }
  its('log_group_name') { should cmp lmf_lg_2_name }
  its('filter_name') { should cmp lmf_2_name }
end
