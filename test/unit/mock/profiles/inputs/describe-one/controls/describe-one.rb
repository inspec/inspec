control "control-01" do
  # Sanity check that inputs in fact do work in control-level DSL as reported on #4523
  value = input("input-inner-control", value: "test-value-01")

  describe.one do
    value = input("input-outer-test", value: "test-value-02")
    describe "test-value-03" do
      it { should cmp input("input-inner-test", value: "test-value-03") }
    end
  end

  describe.one do
    # Verify input_object DSL access works here
    obj = input_object("input-outer-test")
    describe obj.events.count do
      it { should cmp 2 }
    end
  end
end
