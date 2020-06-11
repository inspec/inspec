# frozen_string_literal: true

RSpec.describe TTY::Table::Renderer::ASCII, 'padding' do
  let(:header) { ['Field', 'Type', 'Null', 'Key', 'Default', 'Extra'] }
  let(:rows)   { [['id', 'int(11)', 'YES', 'nil', 'NULL', '']] }
  let(:table)  { TTY::Table.new(header, rows) }

  subject(:renderer) { described_class.new(table, options) }

  context 'with left & right padding' do
    let(:options) { {padding: [0,1,0,1]} }

    it 'pads each field' do
      expect(renderer.render).to eql <<-EOS.chomp
+-------+---------+------+-----+---------+-------+
| Field | Type    | Null | Key | Default | Extra |
+-------+---------+------+-----+---------+-------+
| id    | int(11) | YES  | nil | NULL    |       |
+-------+---------+------+-----+---------+-------+
      EOS
    end
  end

  context 'with top & bottom padding' do
    let(:options) { {padding: [1,0,1,0], multiline: true} }

    it 'pads each field' do
      expect(renderer.render).to eql <<-EOS.chomp
+-----+-------+----+---+-------+-----+
|     |       |    |   |       |     |
|Field|Type   |Null|Key|Default|Extra|
|     |       |    |   |       |     |
+-----+-------+----+---+-------+-----+
|     |       |    |   |       |     |
|id   |int(11)|YES |nil|NULL   |     |
|     |       |    |   |       |     |
+-----+-------+----+---+-------+-----+
      EOS
    end
  end

  context 'with full padding' do
    let(:options) { {padding: [1,1,1,1], multiline: true} }

    it 'pads each field' do
      expect(renderer.render).to eql unindent(<<-EOS)
        +-------+---------+------+-----+---------+-------+
        |       |         |      |     |         |       |
        | Field | Type    | Null | Key | Default | Extra |
        |       |         |      |     |         |       |
        +-------+---------+------+-----+---------+-------+
        |       |         |      |     |         |       |
        | id    | int(11) | YES  | nil | NULL    |       |
        |       |         |      |     |         |       |
        +-------+---------+------+-----+---------+-------+
      EOS
    end
  end

  context "with multiline content padding" do
    it "pads around fields" do
      padding = [1,2,1,2]
      table = TTY::Table.new header: ['header1', 'header2']
      table << ["a1\na1\na1",'a2']
      table << ["b1","b2\nb2"]
      renderer = described_class.new(table, padding: padding, multiline: true)
      expect(renderer.render).to eql unindent(<<-EOS)
        +-----------+-----------+
        |           |           |
        |  header1  |  header2  |
        |           |           |
        +-----------+-----------+
        |           |           |
        |  a1       |  a2       |
        |  a1       |           |
        |  a1       |           |
        |           |           |
        |           |           |
        |  b1       |  b2       |
        |           |  b2       |
        |           |           |
        +-----------+-----------+
      EOS
    end
  end

  context "with resize option" do
    it "pads fields correctly" do
      table = TTY::Table.new(header: [ "Column 1", "Column 2", "Column 3"]) do |t|
        t << [ "11", "12", "13" ]
        t << [ "21", "22", "23" ]
        t << [ "31", "32", "33" ]
      end

      renderer = TTY::Table::Renderer::ASCII.new(table, padding: [1,1,1,1], resize: true, width: 50)
      expect(renderer.render).to eql unindent(<<-EOS)
        +----------------+---------------+---------------+
        |                |               |               |
        | Column 1       | Column 2      | Column 3      |
        |                |               |               |
        +----------------+---------------+---------------+
        |                |               |               |
        | 11             | 12            | 13            |
        |                |               |               |
        |                |               |               |
        | 21             | 22            | 23            |
        |                |               |               |
        |                |               |               |
        | 31             | 32            | 33            |
        |                |               |               |
        +----------------+---------------+---------------+
      EOS
    end
  end
end
