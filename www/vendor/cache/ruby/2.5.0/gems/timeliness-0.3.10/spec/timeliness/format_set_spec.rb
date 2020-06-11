describe Timeliness::FormatSet do
  context "#compile!" do
    let(:set) { Timeliness::FormatSet.new(['yyyy-mm-dd', 'dd/mm/yyyy']) }

    it 'should set the regexp for the set' do
      set.compile!
      expect(set.regexp).not_to be_nil
    end
  end

  context "compiled regexp" do
    context "for time formats" do
      format_tests = {
        'hh:nn:ss'  => {:pass => ['12:12:12', '01:01:01'], :fail => ['1:12:12', '12:1:12', '12:12:1', '12-12-12']},
        'hh-nn-ss'  => {:pass => ['12-12-12', '01-01-01'], :fail => ['1-12-12', '12-1-12', '12-12-1', '12:12:12']},
        'h:nn'      => {:pass => ['12:12', '1:01'], :fail => ['12:2', '12-12']},
        'h.nn'      => {:pass => ['2.12', '12.12'], :fail => ['2.1', '12:12']},
        'h nn'      => {:pass => ['2 12', '12 12'], :fail => ['2 1', '2.12', '12:12']},
        'h-nn'      => {:pass => ['2-12', '12-12'], :fail => ['2-1', '2.12', '12:12']},
        'h:nn_ampm' => {:pass => ['2:12am', '2:12 pm', '2:12 AM', '2:12PM'], :fail => ['1:2am', '1:12  pm', '2.12am']},
        'h.nn_ampm' => {:pass => ['2.12am', '2.12 pm'], :fail => ['1:2am', '1:12  pm', '2:12am']},
        'h nn_ampm' => {:pass => ['2 12am', '2 12 pm'], :fail => ['1 2am', '1 12  pm', '2:12am']},
        'h-nn_ampm' => {:pass => ['2-12am', '2-12 pm'], :fail => ['1-2am', '1-12  pm', '2:12am']},
        'h_ampm'    => {:pass => ['2am', '2 am', '12 pm'], :fail => ['1.am', '12  pm', '2:12am']},
      }
      format_tests.each do |format, values|
        it "should correctly match times in format '#{format}'" do
          regexp = compile_regexp(format)
          values[:pass].each {|value| expect(value).to match(regexp)}
          values[:fail].each {|value| expect(value).not_to match(regexp)}
        end
      end
    end

    context "for date formats" do
      format_tests = {
        'yyyy/mm/dd' => {:pass => ['2000/02/01'], :fail => ['2000\02\01', '2000/2/1', '00/02/01']},
        'yyyy-mm-dd' => {:pass => ['2000-02-01'], :fail => ['2000\02\01', '2000-2-1', '00-02-01']},
        'yyyy.mm.dd' => {:pass => ['2000.02.01'], :fail => ['2000\02\01', '2000.2.1', '00.02.01']},
        'm/d/yy'     => {:pass => ['2/1/01', '02/01/00', '02/01/2000'], :fail => ['2/1/0', '2.1.01']},
        'd/m/yy'     => {:pass => ['1/2/01', '01/02/00', '01/02/2000'], :fail => ['1/2/0', '1.2.01']},
        'm\d\yy'     => {:pass => ['2\1\01', '2\01\00', '02\01\2000'], :fail => ['2\1\0', '2/1/01']},
        'd\m\yy'     => {:pass => ['1\2\01', '1\02\00', '01\02\2000'], :fail => ['1\2\0', '1/2/01']},
        'd-m-yy'     => {:pass => ['1-2-01', '1-02-00', '01-02-2000'], :fail => ['1-2-0', '1/2/01']},
        'd.m.yy'     => {:pass => ['1.2.01', '1.02.00', '01.02.2000'], :fail => ['1.2.0', '1/2/01']},
        'd mmm yy'   => {:pass => ['1 Feb 00', '1 Feb 2000', '1 February 00', '01 February 2000'],
                          :fail => ['1 Fe 00', 'Feb 1 2000', '1 Feb 0']}
      }
      format_tests.each do |format, values|
        it "should correctly match dates in format '#{format}'" do
          regexp = compile_regexp(format)
          values[:pass].each {|value| expect(value).to match(regexp)}
          values[:fail].each {|value| expect(value).not_to match(regexp)}
        end
      end
    end

    context "for datetime formats" do
      format_tests = {
        'ddd mmm d hh:nn:ss zo yyyy'  => {:pass => ['Sat Jul 19 12:00:00 +1000 2008'], :fail => []},
        'yyyy-mm-ddThh:nn:ss(?:Z|zo)' => {:pass => ['2008-07-19T12:00:00+10:00', '2008-07-19T12:00:00Z'], :fail => ['2008-07-19T12:00:00Z+10:00']},
      }
      format_tests.each do |format, values|
        it "should correctly match datetimes in format '#{format}'" do
          regexp = compile_regexp(format)
          values[:pass].each {|value| expect(value).to match(regexp)}
          values[:fail].each {|value| expect(value).not_to match(regexp)}
        end
      end
    end

  end

  context "#match" do
    let(:set) { Timeliness::FormatSet.compile(['yyyy-mm-dd', 'dd/mm/yyyy']) }

    it 'should return array if string matches a format in set' do
      expect(set.match('2000-01-02')).to be_kind_of(Array)
    end

    it 'should return nil if string does not matches a format in set' do
      expect(set.match('2nd Feb 2000')).to be_nil
    end

    it 'should only use specific format string for match if provided' do
      expect(set.match('2000-01-02', 'yyyy-mm-dd')).to be_kind_of(Array)
      expect(set.match('2000-01-02', 'dd/mm/yyyy')).to be_nil
    end

    it 'should compile unknown format for one off match' do
      expect(set.match('20001011')).to be_nil
      expect(set.match('20001011', 'yyyymmdd')).to be_kind_of(Array)
    end
  end

  def compile_regexp(format)
    Timeliness::FormatSet.compile([format]).regexp
  end

end
