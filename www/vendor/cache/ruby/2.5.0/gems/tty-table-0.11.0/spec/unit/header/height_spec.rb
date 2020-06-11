# frozen_string_literal: true

RSpec.describe TTY::Table::Header, '#height' do
  let(:object) { described_class.new header }

  subject { object.height }

  context 'single row' do
    let(:header) { ['h1', 'h1'] }

    it { expect(subject).to eql(1) }
  end

  context 'non escaped multiline' do
    let(:header) { ["h1\nh1\nh1", 'h2'] }

    it { expect(subject).to eql(3)}
  end

  context 'escaped multiline' do
    let(:header) { ["h1\\h1\\h1", 'h2'] }

    it { expect(subject).to eql(1) }
  end
end
