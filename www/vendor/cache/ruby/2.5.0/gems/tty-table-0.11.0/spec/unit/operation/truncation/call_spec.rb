# frozen_string_literal: true

RSpec.describe TTY::Table::Operation::Truncation, '#call' do
  let(:text)   { '太丸ゴシック体' }
  let(:field)  { TTY::Table::Field.new(text) }

  subject(:operation) { described_class.new(column_widths) }

  context 'without column width' do
    let(:column_widths) { [] }

    it "truncates string" do
      expect(operation.call(field, 0, 0)).to eql(text)
    end
  end

  context 'with column width ' do
    let(:column_widths) { [6, 8] }

    it "truncates string for 0 column" do
      expect(operation.call(field, 0, 0)).to eql('太丸…')
    end

    it "truncates string for 1 column" do
      expect(operation.call(field, 0, 1)).to eql('太丸ゴ…')
    end
  end
end
