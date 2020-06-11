# frozen_string_literal: true

RSpec.describe TTY::Table::Header, '#set' do
  let(:object) { described_class }
  let(:attributes) { [:id, :name, :age] }

  subject(:header) { object.new }

  it 'sets the value' do
    header[0] = :id
    expect(header[0]).to eql(:id)
  end

  it 'gets the value' do
    head = object.new [{value: :id}]
    expect(head[0]).to eq(:id)
  end
end
