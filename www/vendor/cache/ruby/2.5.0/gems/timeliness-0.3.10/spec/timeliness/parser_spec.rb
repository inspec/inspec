describe Timeliness::Parser do
  before(:all) do
    Timecop.freeze(2010,1,1,0,0,0)
  end

  describe "parse" do
    it "should return Time object for valid datetime string" do
      expect(parse("2000-01-01 12:13:14")).to be_kind_of(Time)
    end

    it "should return nil for empty string" do
      expect(parse("")).to be_nil
    end

    it "should return nil for nil value" do
      expect(parse(nil)).to be_nil
    end

    it "should return same value if value is a Time, Date, or DateTime" do
      [Time.now, Date.new, DateTime.new].each do |value|
        expect(parse(value)).to eq value
      end
    end

    it "should return nil for non-string non-temporal values" do
      [ {}, [], Class.new ].each do |value|
        expect(parse(value)).to eq nil
      end
    end

    it "should return time object for valid date string" do
      expect(parse("2000-01-01")).to be_kind_of(Time)
    end

    it "should return nil for invalid date string" do
      should_not_parse("2000-02-30")
    end

    it "should return nil for invalid date string where month is '0'" do
      should_not_parse("0/01/2000")
    end

    it "should return nil for invalid date string where month is '00'" do
      should_not_parse("00/01/2000")
    end

    it "should return nil for invalid date month string" do
      should_not_parse("1 Foo 2000")
    end

    it "should return time object for valid time string" do
      expect(parse("12:13:14")).to be_kind_of(Time)
    end

    it "should return nil for invalid time string" do
      should_not_parse("25:00:00")
    end

    it "should return nil for datetime string with invalid date part" do
      should_not_parse("2000-02-30 12:13:14")
    end

    it "should return nil for datetime string with invalid time part" do
      should_not_parse("2000-02-01 25:13:14")
    end

    it 'should return nil for ISO 8601 string with invalid time part' do
      should_not_parse("2000-02-01T25:13:14+02:00")
    end

    context "string with zone offset value" do
      context "when current timezone is earler than string zone" do
        before(:all) do
          Timeliness.default_timezone = :current
          Time.zone = 'Australia/Melbourne'
        end

        it 'should return value shifted by positive offset in default timezone' do
          value = parse("2000-06-01T12:00:00+02:00")
          expect(value).to eq Time.zone.local(2000,6,1,20,0,0)
          expect(value.utc_offset).to eq 10.hours
        end

        it 'should return value shifted by negative offset in default timezone' do
          value = parse("2000-06-01T12:00:00-01:00")
          expect(value).to eq Time.zone.local(2000,6,1,23,0,0)
          expect(value.utc_offset).to eq 10.hours
        end

        after(:all) do
          Time.zone = nil
          Timeliness.default_timezone = :local
        end
      end

      context "when current timezone is later than string zone" do
        before(:all) do
          Timeliness.default_timezone = :current
          Time.zone = 'America/Phoenix'
        end

        it 'should return value shifted by positive offset in default timezone' do
          value = parse("2000-06-01T12:00:00+02:00")
          expect(value).to eq Time.zone.local(2000,6,1,3,0,0)
          expect(value.utc_offset).to eq -7.hours
        end

        it 'should return value shifted by negative offset in default timezone' do
          value = parse("2000-06-01T12:00:00-01:00")
          expect(value).to eq Time.zone.local(2000,6,1,6,0,0)
          expect(value.utc_offset).to eq -7.hours
        end

        after(:all) do
          Time.zone = nil
          Timeliness.default_timezone = :local
        end
      end
    end

    context "string with zone abbreviation" do
      before(:all) do
        Time.zone = 'Australia/Melbourne'
      end

      it 'should return value using string zone adjusted to default :local timezone' do
        Timeliness.default_timezone = :local
        value = parse("Thu, 01 Jun 2000 03:00:00 MST")
        expect(value).to eq Time.utc(2000,6,1,10,0,0).getlocal
        expect(value.utc_offset).to eq Time.mktime(2000, 6, 1, 10, 0, 0).utc_offset
      end

      it 'should return value using string zone adjusted to default :current timezone' do
        Timeliness.default_timezone = :current
        Time.zone = 'Adelaide'
        value = parse("Thu, 01 Jun 2000 03:00:00 MST")
        expect(value).to eq Time.zone.local(2000,6,1,19,30,0)
        expect(value.utc_offset).to eq 9.5.hours
      end

      it 'should return value using string zone adjusted to :zone option string timezone' do
        Timeliness.default_timezone = :local
        value = parse("Thu, 01 Jun 2000 03:00:00 MST", :zone => 'Perth')
        expect(value).to eq Time.use_zone('Perth') { Time.zone.local(2000,6,1,18,0,0) }
        expect(value.utc_offset).to eq 8.hours
      end

      after(:all) do
        Time.zone = nil
      end
    end

    context "with :datetime type" do
      it "should return time object for valid datetime string" do
        expect(parse("2000-01-01 12:13:14", :datetime)).to eq Time.local(2000,1,1,12,13,14)
      end

      it "should return nil for invalid date string" do
        expect(parse("0/01/2000", :datetime)).to be_nil
      end
    end

    context "with :date type" do
      it "should return time object for valid date string" do
        expect(parse("2000-01-01", :date)).to eq Time.local(2000,1,1)
      end

      it "should ignore time in datetime string" do
        expect(parse('2000-02-01 12:13', :date)).to eq Time.local(2000,2,1)
      end

      it "should return nil for invalid date string" do
        expect(parse("0/01/2000", :date)).to be_nil
      end
    end

    context "with :time type" do
      it "should return time object with a dummy date values" do
        expect(parse('12:13', :time)).to eq Time.local(2010,1,1,12,13)
      end

      it "should ignore date in datetime string" do
        expect(parse('2010-02-01 12:13', :time)).to eq Time.local(2010,1,1,12,13)
      end

      it "should raise error if time hour is out of range for AM meridian" do
        expect(parse('13:14 am', :time)).to be_nil
      end
    end

    context "with :now option" do
      it 'should use date parts if string does not specify' do
        time = parse("12:13:14", :now => Time.local(2010,1,1))
        expect(time).to eq Time.local(2010,1,1,12,13,14)
      end
    end

    context "with time value argument" do
      it 'should use argument as :now option value' do
        time = parse("12:13:14", Time.local(2010,1,1))
        expect(time).to eq Time.local(2010,1,1,12,13,14)
      end
    end

    context "with :zone option" do
      context ":utc" do
        it "should return time object in utc timezone" do
          time = parse("2000-06-01 12:13:14", :datetime, :zone => :utc)
          expect(time.utc_offset).to eq 0
        end

        it 'should return nil for partial invalid time component' do
          expect(parse("2000-06-01 12:60", :datetime, :zone => :utc)).to be_nil
        end
      end

      context ":local" do
        it "should return time object in local system timezone" do
          time = parse("2000-06-01 12:13:14", :datetime, :zone => :local)
          expect(time.utc_offset).to eq Time.mktime(2000, 6, 1, 12, 13, 14).utc_offset
        end

        it 'should return nil for partial invalid time component' do
          expect(parse("2000-06-01 12:60", :datetime, :zone => :local)).to be_nil
        end
      end

      context ":current" do
        it "should return time object in current timezone" do
          Time.zone = 'Adelaide'
          time = parse("2000-06-01 12:13:14", :datetime, :zone => :current)
          expect(time.utc_offset).to eq 9.5.hours
        end

        it 'should return nil for partial invalid time component' do
          expect(parse("2000-06-01 12:60", :datetime, :zone => :current)).to be_nil
        end
      end

      context "named zone" do
        it "should return time object in the timezone" do
          time = parse("2000-06-01 12:13:14", :datetime, :zone => 'London')
          expect(time.utc_offset).to eq 1.hour
        end

        it 'should return nil for partial invalid time component' do
          expect(parse("2000-06-01 12:60", :datetime, :zone => 'London')).to be_nil
        end
      end

      context "without ActiveSupport loaded" do
        it 'should output message' do
          expect {
            expect(Time).to receive(:zone).and_raise(NoMethodError.new("undefined method `zone' for Time:Class"))
            parse("2000-06-01 12:13:14", :zone => :current)
          }.to raise_error(Timeliness::Parser::MissingTimezoneSupport)

          expect {
            expect(Time).to receive(:current).and_raise(NoMethodError.new("undefined method `current' for Time:Class"))
            parse("12:13:14", :zone => :current)
          }.to raise_error(Timeliness::Parser::MissingTimezoneSupport)

          expect {
            expect(Time).to receive(:use_zone).and_raise(NoMethodError.new("undefined method `use_zone' for Time:Class"))
            parse("2000-06-01 12:13:14", :zone => 'London')
          }.to raise_error(Timeliness::Parser::MissingTimezoneSupport)
        end
      end
    end

    context "for time type" do
      context "with date from date_for_time_type" do
        before do
          @original = Timeliness.date_for_time_type
        end

        it 'should return date array' do
          Timeliness.date_for_time_type = [2010,1,1]
          expect(parse('12:13:14', :time)).to eq Time.local(2010,1,1,12,13,14)
        end

        it 'should return date array evaluated lambda' do
          Timeliness.date_for_time_type = lambda { Time.local(2010,2,1) }
          expect(parse('12:13:14', :time)).to eq Time.local(2010,2,1,12,13,14)
        end

        after do
          Timeliness.date_for_time_type = @original
        end
      end

      context "with :now option" do
        it 'should use date from :now' do
          expect(parse('12:13:14', :time, :now => Time.local(2010, 6, 1))).to eq Time.local(2010,6,1,12,13,14)
        end
      end

      context "with :zone option" do
        before(:all) do
          Timecop.return
          @current_tz = ENV['TZ']
          ENV['TZ'] = 'Australia/Melbourne'
          Timecop.freeze(2010,1,1,0,0,0)
        end

        it "should use date from the specified zone" do
          time = parse("12:13:14", :time, :zone => :utc)
          expect(time.year).to eq 2009
          expect(time.month).to eq 12
          expect(time.day).to eq 31
        end

        after(:all) do
          Timecop.return
          ENV['TZ'] = @current_tz
          Timecop.freeze(2010,1,1,0,0,0)
        end
      end

    end
  end

  describe "_parse" do
    context "with no type" do
      it "should return date array from date string" do
        time_array = parser._parse('2000-02-01')
        expect(time_array).to eq [2000,2,1,nil,nil,nil,nil,nil]
      end

      it "should return time array from time string" do
        time_array = parser._parse('12:13:14', :time)
        expect(time_array).to eq [nil,nil,nil,12,13,14,nil,nil]
      end

      it "should return datetime array from datetime string" do
        time_array = parser._parse('2000-02-01 12:13:14')
        expect(time_array).to eq [2000,2,1,12,13,14,nil,nil]
      end
    end

    context "with type" do
      it "should return date array from date string" do
        time_array = parser._parse('2000-02-01', :date)
        expect(time_array).to eq [2000,2,1,nil,nil,nil,nil,nil]
      end

      it "should not return time array from time string for :date type" do
        time_array = parser._parse('12:13:14', :date)
        expect(time_array).to eq nil
      end

      it "should return time array from time string" do
        time_array = parser._parse('12:13:14', :time)
        expect(time_array).to eq [nil,nil,nil,12,13,14,nil,nil]
      end

      it "should not return date array from date string for :time type" do
        time_array = parser._parse('2000-02-01', :time)
        expect(time_array).to eq nil
      end

      it "should return datetime array from datetime string when type is date" do
        time_array = parser._parse('2000-02-01 12:13:14', :date)
        expect(time_array).to eq [2000,2,1,12,13,14,nil,nil]
      end

      it "should return date array from date string when type is datetime" do
        time_array = parser._parse('2000-02-01', :datetime)
        expect(time_array).to eq [2000,2,1,nil,nil,nil,nil,nil]
      end

      it "should not return time array from time string when type is datetime" do
        time_array = parser._parse('12:13:14', :datetime)
        expect(time_array).to eq nil
      end
    end

    context "with :strict => true" do
      it "should return nil from date string when type is datetime" do
        time_array = parser._parse('2000-02-01', :datetime, :strict => true)
        expect(time_array).to be_nil
      end

      it "should return nil from datetime string when type is date" do
        time_array = parser._parse('2000-02-01 12:13:14', :date, :strict => true)
        expect(time_array).to be_nil
      end

      it "should return nil from datetime string when type is time" do
        time_array = parser._parse('2000-02-01 12:13:14', :time, :strict => true)
        expect(time_array).to be_nil
      end

      it "should parse date string when type is date" do
        time_array = parser._parse('2000-02-01', :date, :strict => true)
        expect(time_array).not_to be_nil
      end

      it "should parse time string when type is time" do
        time_array = parser._parse('12:13:14', :time, :strict => true)
        expect(time_array).not_to be_nil
      end

      it "should parse datetime string when type is datetime" do
        time_array = parser._parse('2000-02-01 12:13:14', :datetime, :strict => true)
        expect(time_array).not_to be_nil
      end

      it "should ignore strict parsing if no type specified" do
        time_array = parser._parse('2000-02-01', :strict => true)
        expect(time_array).not_to be_nil
      end
    end

    context "with :format option" do
      it "should return values if string matches specified format" do
        time_array = parser._parse('2000-02-01 12:13:14', :datetime, :format => 'yyyy-mm-dd hh:nn:ss')
        expect(time_array).to eq [2000,2,1,12,13,14,nil,nil]
      end

      it "should return nil if string does not match specified format" do
        time_array = parser._parse('2000-02-01 12:13', :datetime, :format => 'yyyy-mm-dd hh:nn:ss')
        expect(time_array).to be_nil
      end
    end

    context "date with ambiguous year" do
      it "should return year in current century if year below threshold" do
        time_array = parser._parse('01-02-29', :date)
        expect(time_array).to eq [2029,2,1,nil,nil,nil,nil,nil]
      end

      it "should return year in last century if year at or above threshold" do
        time_array = parser._parse('01-02-30', :date)
        expect(time_array).to eq [1930,2,1,nil,nil,nil,nil,nil]
      end

      it "should allow custom threshold" do
        default = Timeliness.ambiguous_year_threshold
        Timeliness.ambiguous_year_threshold = 40
        time_array = parser._parse('01-02-39', :date)
        expect(time_array).to eq [2039,2,1,nil,nil,nil,nil,nil]
        time_array = parser._parse('01-02-40', :date)
        expect(time_array).to eq [1940,2,1,nil,nil,nil,nil,nil]
        Timeliness.ambiguous_year_threshold = default
      end
    end
  end

  describe "make_time" do
    it "should return time object for valid time array" do
      time = parser.make_time([2010,9,8,12,13,14])
      expect(time).to eq Time.local(2010,9,8,12,13,14)
    end

    it "should return nil for invalid date in array" do
      time = parser.make_time([2010,13,8,12,13,14])
      expect(time).to be_nil
    end

    it "should return nil for invalid time in array" do
      time = parser.make_time([2010,9,8,25,13,14])
      expect(time).to be_nil
    end

    it "should return nil for invalid time in array with timezone" do
      time = parser.make_time([2010,9,8,25,13,14,0,1])
      expect(time).to be_nil
    end

    context "default timezone" do
      before do
        @default_timezone = Timeliness.default_timezone
      end

      it "should be used if no zone value" do
        Timeliness.default_timezone = :utc
        time = parser.make_time([2000,6,1,12,0,0])
        expect(time.utc_offset).to eq 0
      end

      after do
       Timeliness.default_timezone = @default_timezone
      end
    end

    context "with zone value" do
      context ":utc" do
        it "should return time object in utc timezone" do
          time = parser.make_time([2000,6,1,12,0,0], :utc)
          expect(time.utc_offset).to eq 0
        end
      end

      context ":local" do
        it "should return time object in local system timezone" do
          time = parser.make_time([2000,6,1,12,0,0], :local)
          expect(time.utc_offset).to eq Time.mktime(2000,6,1,12,0,0).utc_offset
        end
      end

      context ":current" do
        it "should return time object in current timezone" do
          Time.zone = 'Adelaide'
          time = parser.make_time([2000,6,1,12,0,0], :current)
          expect(time.utc_offset).to eq 9.5.hours
        end
      end

      context "named zone" do
        it "should return time object in the timezone" do
          time = parser.make_time([2000,6,1,12,0,0], 'London')
          expect(time.utc_offset).to eq 1.hour
        end
      end
    end
  end

  describe "current_date" do

    context "with no options" do
      it 'should return date_for_time_type values with no options' do
        dummy_date = Timeliness.date_for_time_type.call
        expect(current_date).to eq [ dummy_date.year, dummy_date.month, dummy_date.day ]
      end
    end

    context "with :now option" do
      it 'should return date array from Time value' do
        time = Time.now
        date_array = [time.year, time.month, time.day]
        expect(current_date(:now => time)).to eq date_array
      end
    end

    context "with :zone option" do
      it 'should return date array for utc zone' do
        time = Time.now.getutc
        date_array = [time.year, time.month, time.day]
        expect(current_date(:zone => :utc)).to eq date_array
      end

      it 'should return date array for local zone' do
        time = Time.now
        date_array = [time.year, time.month, time.day]
        expect(current_date(:zone => :local)).to eq date_array
      end

      it 'should return date array for current zone' do
        Time.zone = 'London'
        time = Time.current
        date_array = [time.year, time.month, time.day]
        expect(current_date(:zone => :current)).to eq date_array
      end

      it 'should return date array for named zone' do
        time = Time.use_zone('London') { Time.current }
        date_array = [time.year, time.month, time.day]
        expect(current_date(:zone => 'London')).to eq date_array
      end
    end
  end

  after(:all) do
    Timecop.return
  end
end
