+++
title = "google_project_metric resource"
draft = false
gh_repo = "inspec"
platform = "gcp"

[menu]
  [menu.inspec]
    title = "google_project_metric"
    identifier = "inspec/resources/gcp/google_project_metric.md google_project_metric resource"
    parent = "inspec/resources/gcp"
+++

## Syntax

A `google_project_metric` is used to test a Google Metric resource

## Examples

```ruby
describe google_project_metric(project: 'chef-gcp-inspec', name: 'some/metric') do
  it { should exist }
  its('filter') { should cmp 'resource.type=gae_app AND severity>=ERROR' }
  its('metric_descriptor.metric_kind') { should cmp 'DELTA' }
  its('metric_descriptor.value_type') { should cmp 'INT64' }
end

describe google_project_metric(project: 'chef-gcp-inspec', name: 'nonexistent') do
  it { should_not exist }
end
```

### Test that a GCP project metric exists

    describe google_project_metric(project: 'chef-inspec-gcp',  metric: 'metric_name') do
      it { should exist }
    end

### Test that a GCP compute zone has an expected CPU platform

    describe google_project_metric(project: 'chef-inspec-gcp',  metric: 'metric_name') do
      its('filter') { should eq "(protoPayload.serviceName=\"cloudresourcemanager.googleapis.com\")" }
    end

## Properties

Properties that can be accessed from the `google_project_metric` resource:

`name`
: The client-assigned metric identifier. Examples - "error*count", "nginx/requests". Metric identifiers are limited to 100 characters and can include only the following characters A-Z, a-z, 0-9, and the special characters *-.,+!\*',()%/. The forward-slash character (/) denotes a hierarchy of name pieces, and it cannot be the first character of the name.

`description`
: A description of this metric, which is used in documentation. The maximum length of the description is 8000 characters.

`filter`
: An advanced logs filter (https://cloud.google.com/logging/docs/view/advanced-filters) which is used to match log entries.

`metric_descriptor`
: The metric descriptor associated with the logs-based metric.

  `unit`
  : The unit in which the metric value is reported. It is only applicable if the valueType is `INT64`, `DOUBLE`, or `DISTRIBUTION`. The supported units are a subset of [The Unified Code for Units of Measure](http://unitsofmeasure.org/ucum.html) standard

  `value_type`
  : Whether the measurement is an integer, a floating-point number, etc. Some combinations of metricKind and valueType might not be supported. For counter metrics, set this to INT64.

    Possible values:
    - BOOL
    - INT64
    - DOUBLE
    - STRING
    - DISTRIBUTION
    - MONEY

  `metric_kind`
  : Whether the metric records instantaneous values, changes to a value, etc. Some combinations of metricKind and valueType might not be supported. For counter metrics, set this to DELTA.

    Possible values:
    - DELTA
    - GAUGE
    - CUMULATIVE

  `labels`
  : The set of labels that can be used to describe a specific instance of this metric type. For example, the appengine.googleapis.com/http/server/response_latencies metric type has a label for the HTTP response code, response_code, so you can look at latencies for successful responses or just for responses that failed.

    `key`
    : The label key.

    `description`
    : A human-readable description for the label.

    `value_type`
    : The type of data that can be assigned to the label.

      Possible values:
      - BOOL
      - INT64
      - STRING

  `display_name`
  : A concise name for the metric, which can be displayed in user interfaces. Use sentence case  without an ending period, for example "Request count". This field is optional but it is  recommended to be set for any metrics associated with user-visible concepts, such as Quota.

  `type`
  : The metric type, including its DNS name prefix. The type is not URL-encoded. All user-defined metric types have the DNS name `custom.googleapis.com` or `external.googleapis.com`.

`label_extractors`
: A map from a label key string to an extractor expression which is used to extract data from a log entry field and assign as the label value. Each label key specified in the LabelDescriptor must have an associated extractor expression in this map. The syntax of the extractor expression is the same as for the valueExtractor field.

`value_extractor`
: A valueExtractor is required when using a distribution logs-based metric to extract the values to record from a log entry. Two functions are supported for value extraction - EXTRACT(field) or REGEXP_EXTRACT(field, regex). The argument are 1. field - The name of the log entry field from which the value is to be extracted. 2. regex - A regular expression using the Google RE2 syntax (https://github.com/google/re2/wiki/Syntax) with a single capture group to extract data from the specified log entry field. The value of the field is converted to a string before applying the regex. It is an error to specify a regex that does not include exactly one capture group.

`bucket_options`
: The bucketOptions are required when the logs-based metric is using a DISTRIBUTION value type and it describes the bucket boundaries used to create a histogram of the extracted values.

  `linear_buckets`
  : Specifies a linear sequence of buckets that all have the same width (except overflow and underflow). Each bucket represents a constant absolute uncertainty on the specific value in the bucket.

    `num_finite_buckets`
    : Must be greater than 0.

    `width`
    : Must be greater than 0.

    `offset`
    : Lower bound of the first bucket.

  `exponential_buckets`
  : Specifies an exponential sequence of buckets that have a width that is proportional to the value of the lower bound. Each bucket represents a constant relative uncertainty on a specific value in the bucket.

    `num_finite_buckets`
    : Must be greater than 0.

    `growth_factor`
    : Must be greater than 1.

    `scale`
    : Must be greater than 0.

  `explicit_buckets`
  : Specifies a set of buckets with arbitrary widths.

    `bounds`
    : The values must be monotonically increasing.

## GCP Permissions

Ensure the [Stackdriver Logging API](https://console.cloud.google.com/apis/library/logging.googleapis.com/) is enabled for the current project.
