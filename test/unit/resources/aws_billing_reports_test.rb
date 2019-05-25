require 'helper'
require 'inspec/resource'
require 'resources/aws/aws_billing_reports'

require_relative 'aws_billing_backend'

require 'resource_support/aws'
require 'resources/aws/aws_billing_reports'

class ConstructorAwsBillingReportsTest < Minitest::Test
  def setup
    AwsBillingReports::BackendFactory.select(MockAwsBillingReports::Empty)
  end

  def test_empty_params_ok
    assert AwsBillingReports.new
  end

  def test_rejects_unrecognized_params
    assert_raises(ArgumentError) { AwsBillingReports.new(unrecognized_param: 1) }
  end
end

class EmptyAwsBillingReportsTest < Minitest::Test
  def setup
    AwsBillingReports::BackendFactory.select(MockAwsBillingReports::Empty)
  end

  def test_search_miss_reports_empty
    refute AwsBillingReports.new.exists?
  end
end

class BasicAwsBillingReportsTest < Minitest::Test
  def setup
    AwsBillingReports::BackendFactory.select(MockAwsBillingReports::Basic)
  end

  def test_search_hit_via_empty_filter
    assert AwsBillingReports.new.exists?
  end

  def test_search_hit_properties
    assert AwsBillingReports.new.report_names.include?('inspec1')
  end

  def test_where_hit
    abr = AwsBillingReports.new.where { report_name =~ /inspec.*/ }
    assert_includes abr.time_units, 'daily'
    assert_includes abr.compressions, 'zip'
    assert_includes abr.s3_buckets, 'inspec1-s3-bucket'
  end
end

class PaginatedAwsBillingReportsTest < Minitest::Test
  def setup
    AwsBillingReports::BackendFactory.select(MockAwsBillingReports::Paginated)
  end

  def test_paginated_search_hit_via_scalar
    assert AwsBillingReports.new.report_names.include?('inspec12')
  end

  def test_paginated_search_miss_via_scalar
    refute AwsBillingReports.new.report_names.include?('non-existent')
  end
end
