# Custom resource based on the InSpec resource DSL
class InternalFallbackTestResource < Inspec.resource(1)
  name "internal_fallback_test_resource"

  supports platform: "unix"
  supports platform: "windows"

  desc "
    A test resource used to test fallback loading.
    Fallback loading is when a resource is mentioned
    without a profile dependency, yet InSpec core is
    expected to guess the dependency.
  "

  example "
    describe internal_fallback_test_resource do
      its('custom_method') { should 'be_available' }
    end
  "

  def initialize
    # nothing to do
  end

  def custom_method
    "be_available"
  end
end
