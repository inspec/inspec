require 'test_helper'
require 'tins'

module Tins
  class DurationTest < Test::Unit::TestCase
    def test_short_to_s
      assert_equal '00:11:06', Tins::Duration.new(666).to_s
    end

    def test_to_s_with_days
      assert_equal '7+17:11:06', Tins::Duration.new(666666).to_s
    end

    def test_to_s_with_fractional_seconds
      assert_equal '00:11:06.123', Tins::Duration.new(666.123456).to_s
    end

    def test_to_s_with_days_and_fractional_seconds
      assert_equal '7+17:11:06.123', Tins::Duration.new(666666.123456).to_s
    end

    def test_format_without_precision
      assert_equal '0+00:11:06.123456', Tins::Duration.new(666.123456).format
    end

    def test_smart_format
      assert_equal '00:11:06.123', Tins::Duration.new(666.123456).format('%D')
      assert_equal '7+17:11:06.123', Tins::Duration.new(666666.123456).format('%D')
    end

    def test_predicate_days
      s = 0
      assert_false Tins::Duration.new(s).days?
      s += 86_400
      assert_true Tins::Duration.new(s).days?
    end

    def test_predicate_hours
      s = 0
      assert_false Tins::Duration.new(s).hours?
      s += 3600
      assert_true Tins::Duration.new(s).hours?
    end

    def test_predicate_minutes
      s = 0
      assert_false Tins::Duration.new(s).minutes?
      s += 60
      assert_true Tins::Duration.new(s).minutes?
    end

    def test_predicate_seconds
      s = 0
      assert_false Tins::Duration.new(s).seconds?
      s += 1
      assert_true Tins::Duration.new(s).seconds?
    end

    def test_predicate_fractional_seconds
      s = 0
      assert_false Tins::Duration.new(s).fractional_seconds?
      s += 0.1
      assert_true Tins::Duration.new(s).fractional_seconds?
    end

    def test_comparison
      t1 = Tins::Duration.new(666.23456)
      t2 = Tins::Duration.new(666.12345)
      assert_operator t1, :>, t2
    end

    def test_negative_durations
      duration = Tins::Duration.new(-42)
      assert_equal '-0+00:00:42.000000', duration.format
      assert_equal '-00:00:42', duration.to_s
      assert_true duration.negative?
      assert_false Tins::Duration.new(42).negative?
    end
  end
end

