title "Verify no internal properties are exposed in raw data - issue 3110"

fresh_data = ->() do
  [
    { row_id: 0, color: :red   }.dup,
    { row_id: 1, color: :blue  }.dup,
    { row_id: 2, color: :green }.dup,
  ]
end

control "3110_entries" do
  desc "The entries table should not have count or exist"
  describe default_methods_demo(fresh_data.call) do
    its("entries.first.to_h.keys") { should_not include :exist? }
    its("entries.first.to_h.keys") { should_not include :count }
  end
end

control "3110_raw_data" do
  desc "The raw_data table should not have count or exist"
  describe default_methods_demo(fresh_data.call) do
    its("raw_data.first.keys") { should_not include :exist? }
    its("raw_data.first.keys") { should_not include :count }
  end
end
