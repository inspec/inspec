# frozen_string_literal: true

RSpec.describe TTY::Table, '#render_with' do
  let(:header) { ['h1', 'h2', 'h3'] }
  let(:rows)   { [['a1', 'a2', 'a3'], ['b1', 'b2', 'b3']] }
  let(:table)  { described_class.new header, rows }
  let(:color)  { Pastel.new(enabled: true) }

  before { allow(Pastel).to receive(:new).and_return(color) }

  context 'with invalid border class' do
    it "doesn't inherit from TTY::Table::Border" do
      expect { table.render_with String }.to raise_error(TTY::Table::TypeError)
    end

    it "doesn't implement def_border" do
      klass = Class.new(TTY::Table::Border)
      expect { table.render_with klass }.
        to raise_error(TTY::Table::NoImplementationError)
    end
  end

  context 'with complete border' do
    before {
      class MyBorder < TTY::Table::Border
        def_border do
          top          '='
          top_mid      '*'
          top_left     '*'
          top_right    '*'
          bottom       '='
          bottom_mid   '*'
          bottom_left  '*'
          bottom_right '*'
          mid          '='
          mid_mid      '*'
          mid_left     '*'
          mid_right    '*'
          left         '$'
          center       '$'
          right        '$'
        end
      end
    }

    it 'displays custom border' do
      expect(table.render_with(MyBorder)).to eq unindent(<<-EOS)
        *==*==*==*
        $h1$h2$h3$
        *==*==*==*
        $a1$a2$a3$
        $b1$b2$b3$
        *==*==*==*
      EOS
    end
  end

  context 'with incomplete border' do
    before {
      class MyBorder < TTY::Table::Border
        def_border do
          bottom       ' '
          bottom_mid   '*'
          bottom_left  '*'
          bottom_right '*'
          left         '$'
          center       '$'
          right        '$'
        end
      end
    }

    it 'displays border' do
      expect(table.render_with(MyBorder)).to eq unindent(<<-EOS)
        $h1$h2$h3$
        $a1$a2$a3$
        $b1$b2$b3$
        *  *  *  *
      EOS
    end
  end

  context 'with renderer' do
    before {
      class MyBorder < TTY::Table::Border
        def_border do
          left  '|'
          right '|'
        end
      end
    }

    it 'displays border' do
      result = table.render_with MyBorder do |renderer|
        renderer.border.style = :red
      end
      expect(result).to eq unindent(<<-EOS)
        \e[31m|\e[0mh1h2h3\e[31m|\e[0m
        \e[31m|\e[0ma1a2a3\e[31m|\e[0m
        \e[31m|\e[0mb1b2b3\e[31m|\e[0m
      EOS
    end
  end
end # render_with
