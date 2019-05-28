require 'helper'

describe DatabaseHelper do
  describe DatabaseHelper::SQLColumn do
    def column(row = { 'test' => 'value' })
      DatabaseHelper::SQLColumn.new(row, 'test')
    end

    it 'has a valid column value' do
      column.value.must_equal 'value'
    end

    it 'returns empty when nil' do
      column(nil).value.must_equal ''
    end
  end
end
