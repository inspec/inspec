describe Timeliness::Format do
  describe "#compile!" do
    it 'should compile valid string format' do
      expect { 
        Timeliness::Format.new('yyyy-mm-dd hh:nn:ss.u zo').compile!
      }.to_not raise_error
    end

    it 'should return self' do
      format = Timeliness::Format.new('yyyy-mm-dd hh:nn:ss.u zo')
      expect(format.compile!).to eq format
    end

    it 'should raise compilation error for bad format' do
      expect { 
        Timeliness::Format.new('|--[)').compile!
      }.to raise_error(Timeliness::Format::CompilationFailed)
    end
  end

  describe "#process" do
    it "should define method which outputs date array with values in correct order" do
      expect(format_for('yyyy-mm-dd').process('2000', '1', '2')).to eq [2000,1,2,nil,nil,nil,nil,nil]
    end

    it "should define method which outputs date array from format with different order" do
      expect(format_for('dd/mm/yyyy').process('2', '1', '2000')).to eq [2000,1,2,nil,nil,nil,nil,nil]
    end

    it "should define method which outputs date array with zeros when month and day are '0'" do
      expect(format_for('m/d/yy').process('0', '0', '0000')).to eq [0,0,0,nil,nil,nil,nil,nil]
    end

    it "should define method which outputs date array with zeros when month and day are '00'" do
      expect(format_for('m/d/yy').process('00', '00', '0000')).to eq [0,0,0,nil,nil,nil,nil,nil]
    end

    it "should define method which outputs time array" do
      expect(format_for('hh:nn:ss').process('01', '02', '03')).to eq [nil,nil,nil,1,2,3,nil,nil]
    end

    it "should define method which outputs time array with meridian 'pm' adjusted hour" do
      expect(format_for('hh:nn:ss ampm').process('01', '02', '03', 'pm')).to eq [nil,nil,nil,13,2,3,nil,nil]
    end

    it "should define method which outputs time array with meridian 'am' unadjusted hour" do
      expect(format_for('hh:nn:ss ampm').process('01', '02', '03', 'am')).to eq [nil,nil,nil,1,2,3,nil,nil]
    end

    it "should define method which outputs time array with microseconds" do
      expect(format_for('hh:nn:ss.u').process('01', '02', '03', '99')).to eq [nil,nil,nil,1,2,3,990000,nil]
    end

    it "should define method which outputs datetime array with zone offset" do
      expect(format_for('yyyy-mm-dd hh:nn:ss.u zo').process('2001', '02', '03', '04', '05', '06', '99', '+10:00')).to eq [2001,2,3,4,5,6,990000,36000]
    end

    it "should define method which outputs datetime array with timezone string" do
      expect(format_for('yyyy-mm-dd hh:nn:ss.u tz').process('2001', '02', '03', '04', '05', '06', '99', 'EST')).to eq [2001,2,3,4,5,6,990000,'EST']
    end

    context "with long month" do
      let(:format) { format_for('dd mmm yyyy') }

      context "with I18n loaded" do
        before(:all) do
          I18n.locale = :es
          I18n.backend.store_translations :es, :date => { :month_names => %w{ ~ Enero Febrero Marzo } }
          I18n.backend.store_translations :es, :date => { :abbr_month_names => %w{ ~ Ene Feb Mar } }
        end

        it 'should parse abbreviated month for current locale to correct value' do
          expect(format.process('2', 'Ene', '2000')).to eq [2000,1,2,nil,nil,nil,nil,nil]
        end

        it 'should parse full month for current locale to correct value' do
          expect(format.process('2', 'Enero', '2000')).to eq [2000,1,2,nil,nil,nil,nil,nil]
        end

        after(:all) do
          I18n.locale = :en
        end
      end

      context "without I18n loaded" do
        before do
          allow(format).to receive(:i18n_loaded?).and_return(false)
          expect(I18n).not_to receive(:t)
        end

        it 'should parse abbreviated month to correct value' do
          expect(format.process('2', 'Jan', '2000')).to eq [2000,1,2,nil,nil,nil,nil,nil]
        end

        it 'should parse full month to correct value' do
          expect(format.process('2', 'January', '2000')).to eq [2000,1,2,nil,nil,nil,nil,nil]
        end
      end
    end
  end

  def format_for(format)
    Timeliness::Format.new(format).compile!
  end
end
