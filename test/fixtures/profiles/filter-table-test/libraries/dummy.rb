module Dummy
  class Test
    attr_reader :filter_data

    def initialize(data)
      @filter_data = data
    end

    filter = FilterTable.create
    filter.register_column(:names, field: 'name')
    filter.register_column(
      :tags,
      field: :tags,
      # ref: https://github.com/inspec/inspec/blob/master/docs/dev/filtertable-usage.md#lazy-loading
      lazy: lambda do |row, _criterion, _table|
        tags = row['tags']
        if tags.nil?
          raise(Inspec::Exceptions::ResourceSkipped, '`tags` for resource is missing')
        end

        row[:tags] = tags
      end
    )
    filter.install_filter_methods_on_resource(self, :filter_data)
  end
end

class DummyTest < Inspec.resource(1)
  name 'dummy'

  attr_reader :data

  def initialize(data)
    @data = data
  end

  def valid?
    tags
  end

  private

  def tags
    r_data.tags[0]
  end

  def r_data
    Dummy::Test.new(data)
  end
end
