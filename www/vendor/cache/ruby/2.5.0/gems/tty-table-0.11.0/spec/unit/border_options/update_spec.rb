# frozen_string_literal: true

RSpec.describe TTY::Table::BorderOptions, '.update' do

  let(:object) { described_class.new }

  let(:params) { {characters: {top: '*'}, separator: '|', style: :red} }

  subject { object.update(params) }

  it 'sets properties from hash object' do
    expect(subject.characters).to eq({top: '*'})
    expect(subject.separator).to eq('|')
    expect(subject.style).to eq(:red)
  end
end
