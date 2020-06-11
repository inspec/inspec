# frozen_string_literal: true

RSpec.describe TTY::Table, 'padding' do
  let(:header) { ['h1', 'h2', 'h3'] }
  let(:rows)   { [['a1', 'a2', 'a3'], ['b1', 'b2', 'b3']] }
  let(:table)  { described_class.new(header, rows) }

  it 'sets specific padding' do
    expect(table.render(:ascii) { |renderer|
      renderer.padding.right = 2
      renderer.padding.top  = 1
    }).to eq unindent(<<-EOS)
      +----+----+----+
      |    |    |    |
      |h1  |h2  |h3  |
      +----+----+----+
      |    |    |    |
      |a1  |a2  |a3  |
      |    |    |    |
      |b1  |b2  |b3  |
      +----+----+----+
    EOS
  end

  it 'sets padding for all' do
    expect(table.render(:ascii) { |renderer|
      renderer.padding= [1,2,1,2]
    }).to eq unindent(<<-EOS)
      +------+------+------+
      |      |      |      |
      |  h1  |  h2  |  h3  |
      |      |      |      |
      +------+------+------+
      |      |      |      |
      |  a1  |  a2  |  a3  |
      |      |      |      |
      |      |      |      |
      |  b1  |  b2  |  b3  |
      |      |      |      |
      +------+------+------+
    EOS
  end

  context 'with column width' do
    let(:column_widths) { [4,4,4] }

    it 'sets padding for all' do
      expect(table.render(:ascii) { |renderer|
        renderer.column_widths = column_widths
        renderer.padding= [1,2,1,2]
      }).to eq unindent(<<-EOS)
        +--------+--------+--------+
        |        |        |        |
        |  h1    |  h2    |  h3    |
        |        |        |        |
        +--------+--------+--------+
        |        |        |        |
        |  a1    |  a2    |  a3    |
        |        |        |        |
        |        |        |        |
        |  b1    |  b2    |  b3    |
        |        |        |        |
        +--------+--------+--------+
      EOS
    end
  end

  context 'with multi line text' do
    let(:header) { ['h1', 'head2'] }
    let(:rows)   { [["Multi\nLine", "Text\nthat\nwraps"],
                    ["Some\nother\ntext", 'Simple']] }

    context 'when wrapped' do
      it 'sets padding for all' do
        expect(table.render(:ascii) { |renderer|
          renderer.multiline = true
          renderer.padding= [1,2,1,2]
        }).to eq unindent(<<-EOS)
          +---------+----------+
          |         |          |
          |  h1     |  head2   |
          |         |          |
          +---------+----------+
          |         |          |
          |  Multi  |  Text    |
          |  Line   |  that    |
          |         |  wraps   |
          |         |          |
          |         |          |
          |  Some   |  Simple  |
          |  other  |          |
          |  text   |          |
          |         |          |
          +---------+----------+
        EOS
      end
    end

    context 'when escaped' do
      it 'sets padding for all' do
        expect(table.render(:ascii) { |renderer|
          renderer.multiline = false
          renderer.padding= [0,2,0,2]
        }).to eq unindent(<<-EOS)
          +---------------------+---------------------+
          |  h1                 |  head2              |
          +---------------------+---------------------+
          |  Multi\\nLine        |  Text\\nthat\\nwraps  |
          |  Some\\nother\\ntext  |  Simple             |
          +---------------------+---------------------+
        EOS
      end
    end
  end
end
