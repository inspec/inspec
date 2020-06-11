# frozen_string_literal: true

RSpec.describe TTY::Table::Field, '#lines' do
  let(:object) { described_class.new value }

  subject { object.lines }

  context 'with escaped value' do
    let(:value) { "Multi\nLine" }

    it { is_expected.to eql(["Multi", "Line"]) }
  end

  context 'with unescaped value' do
    let(:value) { "Multi\\nLine" }

    it { is_expected.to eql(["Multi\\nLine"]) }
  end
end
