# frozen_string_literal: true

RSpec.describe TTY::Table::Operation::Wrapped, '#call' do
  let(:text)   { 'ラドクリフ、マラソン五輪代表に1万m出場にも含み' }
  let(:field)  { TTY::Table::Field.new(text) }

  subject(:operation) { described_class.new(column_widths) }

  context 'without column width' do
    let(:column_widths) { [] }

    it "doesn't wrap string" do
      expect(operation.call(field, 0, 0)).to eql(text)
    end
  end

  context 'with column width' do
    let(:column_widths) { [12, 14] }

    it "wraps string for 0 column" do
      expect(operation.call(field, 0, 0)).to eql([
        "ラドクリフ、",
        "マラソン五輪",
        "代表に1万m出",
        "場にも含み"
      ].join("\n"))
    end

    it "wraps string for 1 column" do
      expect(operation.call(field, 0, 1)).to eql([
        "ラドクリフ、マ",
        "ラソン五輪代表",
        "に1万m出場にも",
        "含み"
      ].join("\n"))
    end
  end
end
