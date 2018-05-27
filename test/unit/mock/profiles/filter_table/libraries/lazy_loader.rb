class LazyLoader < Inspec.resource(1)
  name 'lazy_loader'

  attr_reader :plain_data
  attr_reader :lazy_2_call_count

  def initialize(provided_data)
    @plain_data = provided_data
    @lazy_2_call_count = 0
  end

  filter_table_generator = FilterTable.create
  filter_table_generator.add_accessor(:where)  
  filter_table_generator.add_accessor(:entries)
  filter_table_generator.add(:exists?) { |table| !table.entries.empty? }      
  filter_table_generator.add(:count) { |table| table.params.count }      
  filter_table_generator.add(:ids, field: :id)
  filter_table_generator.add(:lazy_1s, field: :lazy_1, lazy: ->(r,c) { :lazy_1_loaded } )
  filter_table_generator.add(:lazy_2s, field: :lazy_2, lazy: ->(r,c) { @lazy_2_call_count += 1 } )  
  filter_table_generator.add(:lazy_3s, field: :lazy_3, lazy: ->() { 1 / 0  } )  
  filter_table_generator.connect(self, :plain_data)
end