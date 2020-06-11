# frozen_string_literal: true

RSpec.describe TTY::Table::Header, '#to_ary' do
  let(:object)     { described_class.new(attributes) }
  let(:attributes) { [:id, :name, :age] }

  subject { object.to_ary }

  it { is_expected.to be_instance_of(Array) }

  it { is_expected.to eq(attributes) }
end
