describe Timeliness::CoreExt, 'String' do
  # Test values taken from ActiveSupport unit tests for compatibility

  describe "#to_time" do
    it 'should convert valid string to Time object in default zone' do
      expect("2005-02-27 23:50".to_time).to eq Time.utc(2005, 2, 27, 23, 50)
    end

    it 'should convert ISO 8601 string to Time object' do
      expect("2005-02-27T23:50:19.275038".to_time).to eq Time.utc(2005, 2, 27, 23, 50, 19, 275038)
    end

    context "with :local" do
      it 'should convert valid string to local time' do
        expect("2005-02-27 23:50".to_time(:local)).to eq Time.local(2005, 2, 27, 23, 50)
      end

      it 'should convert ISO 8601 string to local time' do
        expect("2005-02-27T23:50:19.275038".to_time(:local)).to eq Time.local(2005, 2, 27, 23, 50, 19, 275038)
      end
    end

    it 'should convert valid future string to Time object' do
      expect("2039-02-27 23:50".to_time(:local)).to eq Time.local(2039, 2, 27, 23, 50)
    end

    it 'should convert valid future string to Time object' do
      expect("2039-02-27 23:50".to_time).to eq DateTime.civil(2039, 2, 27, 23, 50)
    end

    it 'should convert empty string to nil' do
      expect(''.to_time).to be_nil
    end
  end

  describe "#to_datetime" do
    it 'should convert valid string to DateTime object' do
      expect("2039-02-27 23:50".to_datetime).to eq DateTime.civil(2039, 2, 27, 23, 50)
    end

    it 'should convert to DateTime object with UTC offset' do
      expect("2039-02-27 23:50".to_datetime.offset).to eq 0
    end

    it 'should convert ISO 8601 string to DateTime object' do
      datetime = DateTime.civil(2039, 2, 27, 23, 50, 19 + Rational(275038, 1000000), "-04:00")
      expect("2039-02-27T23:50:19.275038-04:00".to_datetime).to eq datetime
    end

    it 'should use Rubys default start value' do
      # Taken from ActiveSupport unit tests. Not sure on the implication.
      expect("2039-02-27 23:50".to_datetime.start).to eq ::Date::ITALY
    end

    it 'should convert empty string to nil' do
      expect(''.to_datetime).to be_nil
    end
  end

  describe "#to_date" do
    it 'should convert string to Date object' do
      expect("2005-02-27".to_date).to eq Date.new(2005, 2, 27)
    end

    it 'should convert empty string to nil' do
      expect(''.to_date).to be_nil
    end
  end

end
