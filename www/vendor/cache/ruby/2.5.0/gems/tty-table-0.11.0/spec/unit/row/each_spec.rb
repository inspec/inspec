# frozen_string_literal: true

RSpec.describe TTY::Table::Row, '#new' do
  let(:yields) { [] }
  let(:value)  { 'a1' }
  let(:header) { ['Header1']}
  let(:row)    { [ value ] }
  let(:object) { described_class.new row, header }

  context 'with block' do
    subject { object.each { |field| yields << field } }

    it 'yields only fields' do
      subject
      yields.each { |field| expect(field).to be_instance_of(value.class) }
    end

    it 'yields rows with expected attributes' do
      subject
      yields.each { |field| expect(field).to eql(value) }
    end

    it 'yields each row' do
      expect { subject }.to change { yields }.
        from( [] ).
        to( yields )
    end
  end
end
