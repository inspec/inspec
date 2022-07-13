require "functional/helper"

describe "inspec schema" do
  include FunctionalHelper

  describe "extracting the platforms schema export" do
    it "can execute a platforms schema command" do
      out = inspec("schema platforms")

      data = JSON.parse(out.stdout)
      _(data.class).must_equal Array
      _(data.size).must_be(:>, 1)
      _(data[0]["name"]).must_equal "aix"
      families = %w{aix unix os}
      _(data[0]["families"]).must_equal families

      _(out.stderr).must_equal ""

      assert_exit_code 0, out
    end
  end

  describe "validate schema of exec-json" do
    it "contains resource_id key" do
      out = inspec("schema exec-json")
      json_output = JSON.parse(out.stdout)
      _(json_output["definitions"]["Control_Result"]["properties"]["resource_id"]).wont_be_nil
      # status value to be nil when not using enhanced outcomes flag
      assert_nil(json_output["definitions"]["Exec_JSON_Control"]["properties"]["status"])
    end
  end

  describe "validate schema of exec-json with enhanced_outcomes option" do
    it "contains resource_id key" do
      out = inspec("schema exec-json --enhanced-outcomes")
      json_output = JSON.parse(out.stdout)
      _(json_output["definitions"]["Exec_JSON_Control"]["properties"]["status"]).wont_be_nil
    end
  end
end
