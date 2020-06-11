# frozen_string_literal: true

RSpec.describe TTY::Table::Border::Null, '#rendering' do
  let(:border) { nil }

  subject { described_class.new column_widths, border }

  context 'with empty row' do
    let(:row) { TTY::Table::Row.new([]) }
    let(:column_widths) { [] }

    it 'draws top line' do
      expect(subject.top_line).to be_nil
    end

    it 'draws middle line' do
      expect(subject.separator).to be_nil
    end

    it 'draw bottom line' do
      expect(subject.bottom_line).to be_nil
    end

    it 'draws row line' do
      expect(subject.row_line(row)).to eq('')
    end
  end

  context 'with row' do
    let(:row) { TTY::Table::Row.new(['a1', 'a2', 'a3']) }
    let(:column_widths) { [2,2,2] }

    it 'draws top line' do
      expect(subject.top_line).to be_nil
    end

    it 'draw middle line' do
      expect(subject.separator).to be_nil
    end

    it 'draw bottom line' do
      expect(subject.bottom_line).to be_nil
    end

    it 'draws row line' do
      expect(subject.row_line(row)).to eq('a1 a2 a3')
    end
  end

  context 'with multiline row' do
    let(:column_widths) { [2,2,2] }

    context 'with mixed data' do
      let(:row) { TTY::Table::Row.new(["a1\nb1\nc1", 'a2', 'a3']) }

      it 'draws row line' do
        expect(subject.row_line(row)).to eq unindent(<<-EOS)
          a1 a2 a3
          b1      
          c1      
        EOS
      end
    end

    context 'with sparse data' do
      let(:row) { TTY::Table::Row.new(["a1\n\n", "\na2\n", "\n\na3"]) }

      it 'draws row line' do
        expect(subject.row_line(row)).to eq <<-EOS.chomp
a1      
   a2   
      a3
        EOS
      end
    end

    context 'with empty data' do
      let(:row) { TTY::Table::Row.new(["\na1\n", "\na2\n", "\na3\n"]) }

      it 'draws row line' do
        expect(subject.row_line(row)).to eq <<-EOS.chomp
        
a1 a2 a3
        
        EOS
      end
    end
  end

  context 'with border' do
    let(:row) { TTY::Table::Row.new(['a1', 'a2', 'a3']) }
    let(:column_widths) { [2,2,2] }
    let(:border) { { :characters => {
      'top'          => '=',
      'top_mid'      => '=',
      'top_left'     => '=',
      'top_right'    => '=',
      'bottom'       => '=',
      'bottom_mid'   => '=',
      'bottom_left'  => '=',
      'bottom_right' => '=',
      'mid'          => '=',
      'mid_mid'      => '=',
      'mid_left'     => '=',
      'mid_right'    => '=',
      'left'         => '=',
      'center'       => '=',
      'right'        => '='
    } } }


    it 'draws top line' do
      expect(subject.top_line).to eql '=========='
    end

    it 'draws separator line' do
      expect(subject.separator).to eql '=========='
    end

    it 'draws bottom line' do
      expect(subject.bottom_line).to eql '=========='
    end

    it 'draws row line' do
      expect(subject.row_line(row)).to eql '=a1=a2=a3='
    end
  end
end
