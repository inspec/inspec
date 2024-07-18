# Custom resource based on the InSpec resource DSL
class DemoResourcePackResource < Inspec.resource(1)
  name 'demo_resource'

  supports platform: 'unix'
  supports platform: 'windows'

  desc "
    A test resource used to test the Resource Pack plugin type.
  "

  example "
    describe demo_resource do
      its should { deliver_value_and_delight_customers }
    end
  "

  def initialize
    # nothing to do
  end

  # Example method called by 'it { should deliver_value_and_delight_customers }'
  def deliver_value_and_delight_customers?
    true
  end
end
