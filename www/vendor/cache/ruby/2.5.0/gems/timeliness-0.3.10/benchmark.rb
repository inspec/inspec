$:.unshift(File.expand_path('lib'))

require 'benchmark'
require 'time'
require 'parsedate' unless RUBY_VERSION =~ /^1\.9\./
require 'timeliness'

if defined?(JRUBY_VERSION)
  # Warm up JRuby
  20_000.times do
    Time.parse("2000-01-04 12:12:12")
    Timeliness::Parser.parse("2000-01-04 12:12:12", :datetime)
  end
end

n = 10_000
Benchmark.bm do |x|
  x.report('timeliness - datetime') {
    n.times do
      Timeliness::Parser.parse("2000-01-04 12:12:12", :datetime)
    end
  }

  x.report('timeliness - datetime with :format') {
    n.times do
      Timeliness::Parser.parse("2000-01-04 12:12:12", :datetime, :format => 'yyyy-mm-dd hh:nn:ss')
    end
  }

  x.report('timeliness - date') {
    n.times do
      Timeliness::Parser.parse("2000-01-04", :date)
    end
  }

  x.report('timeliness - date as datetime') {
    n.times do
      Timeliness::Parser.parse("2000-01-04", :datetime)
    end
  }

  x.report('timeliness - time') {
    n.times do
      Timeliness::Parser.parse("12:01:02", :time)
    end
  }

  x.report('timeliness - no type with datetime value') {
    n.times do
      Timeliness::Parser.parse("2000-01-04 12:12:12")
    end
  }

  x.report('timeliness - no type with date value') {
    n.times do
      Timeliness::Parser.parse("2000-01-04")
    end
  }

  x.report('timeliness - no type with time value') {
    n.times do
      Timeliness::Parser.parse("12:01:02")
    end
  }

  x.report('timeliness - invalid format datetime') {
    n.times do
      Timeliness::Parser.parse("20xx-01-04 12:12:12", :datetime)
    end
  }

  x.report('timeliness - invalid format date') {
    n.times do
      Timeliness::Parser.parse("20xx-01-04", :date)
    end
  }

  x.report('timeliness - invalid format time') {
    n.times do
      Timeliness::Parser.parse("12:xx:02", :time)
    end
  }

  x.report('timeliness - invalid value datetime') {
    n.times do
      Timeliness::Parser.parse("2000-01-32 12:12:12", :datetime)
    end
  }

  x.report('timeliness - invalid value date') {
    n.times do
      Timeliness::Parser.parse("2000-01-32", :date)
    end
  }

  x.report('timeliness - invalid value time') {
    n.times do
      Timeliness::Parser.parse("12:61:02", :time)
    end
  }

  x.report('ISO regexp for datetime') {
    n.times do
      "2000-01-04 12:12:12" =~ /\A(\d{4})-(\d{2})-(\d{2}) (\d{2})[\. :](\d{2})([\. :](\d{2}))?\Z/
      Time.mktime($1.to_i, $2.to_i, $3.to_i, $3.to_i, $5.to_i, $6.to_i)
    end
  }

  x.report('Time.parse - valid') {
    n.times do
      Time.parse("2000-01-04 12:12:12")
    end
  }

  x.report('Time.parse - invalid ') {
    n.times do
      Time.parse("2000-01-32 12:12:12") rescue nil
    end
  }

  x.report('Date._parse - valid') {
    n.times do
      hash = Date._parse("2000-01-04 12:12:12")
      Time.mktime(hash[:year], hash[:mon], hash[:mday], hash[:hour], hash[:min], hash[:sec])
    end
  }

  x.report('Date._parse - invalid ') {
    n.times do
      hash = Date._parse("2000-01-32 12:12:12")
      Time.mktime(hash[:year], hash[:mon], hash[:mday], hash[:hour], hash[:min], hash[:sex]) rescue nil
    end
  }

  if defined?(ParseDate)
    x.report('parsedate - valid') {
      n.times do
        arr = ParseDate.parsedate("2000-01-04 12:12:12")
        Date.new(*arr[0..2])
        Time.mktime(*arr)
      end
    }

    x.report('parsedate - invalid ') {
      n.times do
        arr = ParseDate.parsedate("2000-00-04 12:12:12")
      end
    }
  end

  x.report('strptime - valid') {
    n.times do
      DateTime.strptime("2000-01-04 12:12:12", '%Y-%m-%d %H:%M:%s')
    end
  }

  x.report('strptime - invalid') {
    n.times do
      DateTime.strptime("2000-00-04 12:12:12", '%Y-%m-%d %H:%M:%s') rescue nil
    end
  }
end
