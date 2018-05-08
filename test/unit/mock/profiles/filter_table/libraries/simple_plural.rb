class SimplePlural < Inspec.resource(1)
  name 'simple_plural'

  attr_reader :plain_data

  def initialize(provided_data)
    @plain_data = provided_data
  end

  filter_table_generator = FilterTable.create
  filter_table_generator.add_accessor(:where)  
  filter_table_generator.add_accessor(:entries)
  filter_table_generator.add(:exists?) { |x| !x.entries.empty? }      
  filter_table_generator.add(:ids, field: :id)
  filter_table_generator.connect(self, :plain_data)
end