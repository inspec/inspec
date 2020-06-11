# frozen_string_literal: true

RSpec.describe TTY::Table::BorderOptions, '.new' do

  subject(:options) { described_class.new }

  it { expect(subject.characters).to eql({}) }

  it { expect(subject.separator).to be_nil }

  it { expect(subject.style).to  be_nil }
end # new
