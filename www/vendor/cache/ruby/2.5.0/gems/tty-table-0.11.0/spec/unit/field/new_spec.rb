# frozen_string_literal: true

RSpec.describe TTY::Table::Field, '#new' do
  let(:object) { described_class }

  subject { object.new value }

  context 'with only value' do
    let(:value) { 'foo' }

    it { is_expected.to be_instance_of(object) }

    it { expect(subject.value).to  eql(value) }

    it { expect(subject.height).to eql(1) }
  end

  context 'with hash value' do
    let(:value) { { :value => 'foo' } }

    it { is_expected.to be_instance_of(object) }

    it { expect(subject.value).to eql('foo') }

    it { expect(subject.height).to eql(1) }
  end
end
