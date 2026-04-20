# Custom resource based on the InSpec resource DSL
class DemoResourcePackResource < Inspec.resource(1)
  name "demo_resource"

  supports platform: "unix"
  supports platform: "windows"

  desc "
    A test resource used to test the Resource Pack plugin type.
  "

  example "
    describe demo_resource do
      its('awesomeness') { should cmp 'extreme' }}
    end
  "

  def initialize
    # nothing to do
  end

  def awesomeness
    "extreme"
  end
end
