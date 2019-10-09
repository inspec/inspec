class ExampleConfig < Inspec.resource(1)
  name 'example_config'

  desc "Example's resource description ..."

  example "
    describe example_config do
      its('version') { should eq('1.0') }
    end
  "

  def version
    "1.0"
  end
end
