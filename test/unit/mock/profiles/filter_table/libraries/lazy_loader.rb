class LazyLoader < Inspec.resource(1)
  name "lazy_loader"

  attr_reader :plain_data
  attr_accessor :lazy_3_call_count

  def initialize(provided_data)
    @plain_data = provided_data
    @lazy_3_call_count = 0
  end

  filter_table_generator = FilterTable.create
  filter_table_generator.add_accessor(:where)
  filter_table_generator.add_accessor(:entries)
  filter_table_generator.add(:exists?) { |table| !table.entries.empty? }
  filter_table_generator.add(:count) { |table| table.params.count }
  filter_table_generator.add(:ids, field: :id)
  filter_table_generator.add(:colors, field: :color)
  filter_table_generator.add(:lazy_1s, field: :lazy_1, lazy: ->(r, c, t) { r[:lazy_1] = :lazy_1_loaded } )
  filter_table_generator.add(:lazy_2s, field: :lazy_2, lazy: ->(r, c, t) { r[:lazy_2] = :lazy_2_loaded } )
  filter_table_generator.add(:lazy_3s, field: :lazy_3, lazy: ->(r, c, t) { r[:lazy_3] = t.resource.lazy_3_call_count += 1 } )
  filter_table_generator.add(:lazy_4s, field: :lazy_4, lazy: ->(r, c, t) { 1 / 0 } )
  filter_table_generator.connect(self, :plain_data)
end
