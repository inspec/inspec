describe Timeliness::Definitions do

  context "add_formats" do
    before do
      @default_formats = definitions.time_formats.dup
    end

    it "should add format to format array" do
      definitions.add_formats(:time, "h o'clock")
      expect(definitions.time_formats).to include("h o'clock")
    end

    it "should parse new format after its added" do
      should_not_parse("12 o'clock", :time)
      definitions.add_formats(:time, "h o'clock")
      should_parse("12 o'clock", :time)
    end

    it "should raise error if format exists" do
      expect { definitions.add_formats(:time, "hh:nn:ss") }.to raise_error(Timeliness::Definitions::DuplicateFormat)
    end

    context "with :before option" do
      it "should add new format with higher precedence" do
        definitions.add_formats(:time, "ss:hh:nn", :before => 'hh:nn:ss')
        time_array = parser._parse('59:23:58', :time)
        expect(time_array).to eq [nil,nil,nil,23,58,59,nil,nil]
      end

      it "should raise error if :before format does not exist" do
        expect { definitions.add_formats(:time, "ss:hh:nn", :before => 'nn:hh:ss') }.to raise_error(Timeliness::Definitions::FormatNotFound)
      end
    end

    after do
      definitions.time_formats = @default_formats
      definitions.compile_formats
    end
  end

  context "remove_formats" do
    before do
      @default_formats = definitions.time_formats.dup
    end

    it "should remove a single format from the formats array for type" do
      definitions.remove_formats(:time, 'h.nn_ampm')
      expect(definitions.time_formats).not_to include('h.nn_ampm')
    end

    it "should remove multiple formats from formats array for type" do
      definitions.remove_formats(:time, 'h:nn', 'h.nn_ampm')
      expect(definitions.time_formats).not_to include('h:nn')
      expect(definitions.time_formats).not_to include('h.nn_ampm')
    end

    it "should prevent parsing of removed format" do
      should_parse('2.12am', :time)
      definitions.remove_formats(:time, 'h.nn_ampm')
      should_not_parse('2.12am', :time)
    end

    it "should raise error if format does not exist" do
      expect { definitions.remove_formats(:time, "ss:hh:nn") }.to raise_error(Timeliness::Definitions::FormatNotFound)
    end

    after do
      definitions.time_formats = @default_formats
      definitions.compile_formats
    end
  end

  context "use_euro_formats" do
    it "should allow ambiguous date to be parsed as European format" do
      expect(parser._parse('01/02/2000', :date)).to eq [2000,1,2,nil,nil,nil,nil,nil]
      definitions.use_euro_formats
      expect(parser._parse('01/02/2000', :date)).to eq [2000,2,1,nil,nil,nil,nil,nil]
    end

    it "should not parse formats on switch to euro after initial compile" do
      definitions.compile_formats
      expect(Timeliness::FormatSet).not_to receive(:compile)
      definitions.use_euro_formats
    end
  end

  context "use_us_formats" do
    before do
      definitions.use_euro_formats
    end

    it "should allow ambiguous date to be parsed as European format" do
      expect(parser._parse('01/02/2000', :date)).to eq [2000,2,1,nil,nil,nil,nil,nil]
      definitions.use_us_formats
      expect(parser._parse('01/02/2000', :date)).to eq [2000,1,2,nil,nil,nil,nil,nil]
    end

    it "should not parse formats on switch to euro after initial compile" do
      definitions.compile_formats
      expect(Timeliness::FormatSet).not_to receive(:compile)
      definitions.use_us_formats
    end
  end
end
