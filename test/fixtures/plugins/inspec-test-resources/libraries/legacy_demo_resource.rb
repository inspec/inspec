# A legacy-layout resource used to verify that GemReader loads resources
# from the libraries/ directory (legacy cloud resource pack layout).
class LegacyDemoResource < Inspec.resource(1)
  name "legacy_demo_resource"

  supports platform: "unix"
  supports platform: "windows"

  desc "A test resource in the legacy libraries/ layout used to verify GemReader loads it."

  def legacy_awesomeness
    "legacy_extreme"
  end
end
