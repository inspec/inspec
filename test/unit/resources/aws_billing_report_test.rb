require 'helper'
require 'inspec/resource'
require 'resources/aws/aws_billing_report'

require_relative 'aws_billing_backend' # TODO: move this to mocks

require 'resource_support/aws'
require 'resources/aws/aws_billing_report'

class EmptyAwsBillingReportTest < Minitest::Test
  def setup
    AwsBillingReport::BackendFactory.select(MockAwsBillingReports::Empty)
  end

  def test_empty_query
    assert_raises(ArgumentError) { AwsBillingReport.new }
  end
end

class BasicAwsBillingReportTest < Minitest::Test
  def setup
    AwsBillingReport::BackendFactory.select(MockAwsBillingReports::Basic)
  end

  def test_search_hit_via_scalar
    assert AwsBillingReport.new('inspec1').exists?
  end

  def test_search_miss_via_scalar
    refute AwsBillingReport.new('non-existent').exists?
  end

  def test_search_hit_via_hash_works
    assert AwsBillingReport.new(report_name: 'inspec1').exists?
  end

  def test_search_miss_is_not_an_exception
    refute AwsBillingReport.new(report_name: 'non-existent').exists?
  end

  def test_search_hit_properties
    r = AwsBillingReport.new('inspec1')
    assert_equal('inspec1', r.report_name)
    assert_equal('hourly', r.time_unit)
    assert_equal('zip', r.compression)
    assert_equal('inspec1-s3-bucket', r.s3_bucket)
    assert_equal('inspec1/accounting', r.s3_prefix)
    assert_equal('us-east-1', r.s3_region)
  end

  def test_hourly?
    assert AwsBillingReport.new('inspec1').hourly?
    refute AwsBillingReport.new('inspec2').hourly?
  end

  def test_daily?
    assert AwsBillingReport.new('inspec2').daily?
    refute AwsBillingReport.new('inspec1').daily?
  end

  def test_zip?
    assert AwsBillingReport.new('inspec1').zip?
    refute AwsBillingReport.new('inspec2').zip?
  end

  def test_gzip?
    assert AwsBillingReport.new('inspec2').gzip?
    refute AwsBillingReport.new('inspec1').gzip?
  end
end

class PaginatedAwsBillingReportTest < Minitest::Test
  def setup
    AwsBillingReport::BackendFactory.select(MockAwsBillingReports::Paginated)
  end

  def test_paginated_search_hit_via_scalar
    assert AwsBillingReport.new('inspec8').exists?
  end

  def test_paginated_search_miss_via_scalar
    refute AwsBillingReport.new('non-existent').exists?
  end
end
