# frozen_string_literal: true

RSpec.describe TTY::Table::Row, '#height' do
  let(:object) { described_class.new row }

  subject { object.height }

  context 'single row' do
    let(:row) { ['a1', 'b1'] }

    it { expect(subject).to eql(1) }
  end

  context 'non escaped multiline' do
    let(:row) { ["a1\na2\na3", 'b1'] }

    it { expect(subject).to eql(3)}
  end

  context 'escaped multiline' do
    let(:row) { ["a1\\na2\\na3", 'b1'] }

    it { expect(subject).to eql(1) }
  end
end
