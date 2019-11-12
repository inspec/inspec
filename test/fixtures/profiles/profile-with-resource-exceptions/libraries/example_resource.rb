class ExceptionResourceTest < Inspec.resource(1)
  name 'exception_resource_test'

  desc '
    Used to test resource exceptions.
  '

  example "
    # Should execute always and pass
    describe exception_resource_test('foo') do
      its('value') { should eq 'foo' }
    end

    # Should execute always and fail
    describe exception_resource_test('foo') do
      its('value') { should eq 'bar' }
    end

    # Should raise Inspec::Exceptions::SkipResource but not halt run
    # Example: Command not found
    describe exception_resource_test('foo', :skip_me) do
      its('value') { should eq 'foo' }
    end

    # Should raise Inspec::Exceptions::FailResource but not halt run
    # Example: Command failed
    describe exception_resource_test('foo', :fail_me) do
      its('value') { should eq 'foo' }
    end
  "

  attr_reader :value

  def initialize(value, qualifier = nil)
    @value = value
    @inside_matcher = inside_matcher
    case qualifier
    when :skip_me
      raise Inspec::Exceptions::ResourceSkipped, 'Skipping because reasons'
    when :fail_me
      raise Inspec::Exceptions::ResourceFailed, 'Failing because reasons'
    end
  end

  filter = FilterTable.create
  filter.add_accessor(:where)
        .add_accessor(:entries)
        .add(:matters,  field: 'matters')
        .add(:another_filter,  field: 'another_filter')
        .connect(self, :filters_example)

  private

  def filters_example
    case @value
    when 'skip_me'
      raise Inspec::Exceptions::ResourceSkipped, 'Skipping inside FilterTable'
    when 'fail_me'
      raise Inspec::Exceptions::ResourceFailed, 'Failing inside FilterTable'
    end
    [{ 'matters' => 'it really does', 'another_filter' => 'example' }]
  end

  def inside_matcher
    case @value
    when 'fail inside matcher'
      raise Inspec::Exceptions::ResourceFailed, 'Failing inside matcher'
    when 'skip inside matcher'
      raise Inspec::Exceptions::ResourceSkipped, 'Skipping inside matcher'
    else
      'inside_matcher'
    end
  end
end
