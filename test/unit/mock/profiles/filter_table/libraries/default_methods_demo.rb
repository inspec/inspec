class DefaultMethodsDemo < Inspec.resource(1)
  name "default_methods_demo"

  attr_reader :plain_data

  def initialize(provided_data)
    @plain_data = provided_data
  end

  filter_table_generator = FilterTable.create
  filter_table_generator.add(:ids, field: :id)
  filter_table_generator.connect(self, :plain_data)
end
