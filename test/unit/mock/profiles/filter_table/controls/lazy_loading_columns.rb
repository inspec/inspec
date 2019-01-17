title "Verify lazy loading columns works correctly - issue 2370"

fresh_data = ->() do
  [
    { row_id: 0, color: :red }.dup,
    { row_id: 1, color: :blue, lazy_2: :pre_existing }.dup,
    { row_id: 2, color: :green }.dup,
  ]
end

# Fixture notes:
# lazy_1 populates with a constant symbol
# lazy_2 populates with a constant symbol but encounters a collision
# lazy_3 increments on each call
# lazy_4 throws an exception on call

control "2370_where_block" do
  desc "When we call where as a block, lazy columns should load if referenced"
  describe lazy_loader(fresh_data.call).where { lazy_1 == :lazy_1_loaded } do
    its("count") { should cmp 3 }
    its("lazy_1s.first") { should cmp :lazy_1_loaded }
  end

  describe lazy_loader(fresh_data.call).where { lazy_3 == 1 } do
    its("count") { should cmp 1 }
    its("lazy_3s.first") { should cmp 1 }
    its("resource.lazy_3_call_count") { should == 3 }
  end
end

control "2370_where_block_only_referenced" do
  desc "When we call where as a block, lazy columns should not load unless referenced"
  describe lazy_loader(fresh_data.call).where { color == :red } do
    [ :lazy_1, :lazy_2, :lazy_3, :lazy_4 ].each do |lazy_field|
      its("raw_data.first.keys") { should_not include lazy_field }
    end
  end
end

control "2370_where_method" do
  desc "When we call where as a method, lazy columns should load if referenced"
  describe lazy_loader(fresh_data.call).where(lazy_1: :lazy_1_loaded) do
    its("count") { should cmp 3 }
    its("lazy_1s.first") { should cmp :lazy_1_loaded }
  end

  describe lazy_loader(fresh_data.call).where(lazy_3: 1) do
    its("count") { should cmp 1 }
    its("lazy_3s.first") { should cmp 1 }
    its("resource.lazy_3_call_count") { should == 3 }
  end
end

control "2370_where_method_only_referenced" do
  desc "When we call where as a method, lazy columns should not load unless referenced"
  describe lazy_loader(fresh_data.call).where(color: :red) do
    [ :lazy_1, :lazy_2, :lazy_3, :lazy_4 ].each do |lazy_field|
      its("params.first.keys") { should_not include lazy_field }
    end
  end
end

control "2370_populate_once" do
  desc "When we have already triggered a populate, the proc should not be called again"
  describe lazy_loader(fresh_data.call).where { lazy_3.kind_of? Integer }.where { lazy_3.kind_of? Integer } do
    its("count") { should cmp 3 }
    its("lazy_3s.first") { should == 1 }
    its("resource.lazy_3_call_count") { should == 3 }
  end
end

control "2370_no_side_populate" do
  desc "When we trigger a populate on one column, it should not trigger a populate on another column."
  describe lazy_loader(fresh_data.call).where( lazy_1: :lazy_1_loaded ) do
    [ :lazy_2, :lazy_3, :lazy_4 ].each do |lazy_field|
      its("params.first.keys") { should_not include lazy_field }
    end
  end
end

control "2370_no_clobber" do
  desc "When we trigger a populate, it should not clobber existing values in the table."
  describe lazy_loader(fresh_data.call).lazy_2s do
    it { should include :lazy_2_loaded }
    it { should include :pre_existing }
  end
end

control "2370_list_property" do
  desc "When we call a list property on a lazy column, we should get the list"
  describe lazy_loader(fresh_data.call).lazy_1s do
    its("count") { should cmp 3 }
    it { should include :lazy_1_loaded }
  end
end

control "2370_list_property_filter_method" do
  desc "When we call a list property on a lazy column with a filter value, we should get a filtered table"
  describe lazy_loader(fresh_data.call).lazy_3s(2) do
    its("count") { should cmp 1 }
    its("lazy_3s.first") { should cmp 2 }
  end
end

control "2370_list_property_filter_block" do
  desc "When we call a list property on a lazy column with a filter block, we should get a filtered table"
  describe lazy_loader(fresh_data.call).lazy_3s(2) { lazy_3 == 2 } do
    its("count") { should cmp 1 }
    its("lazy_3s.first") { should cmp 2 }
  end
end

control "2370_no_rows" do
  desc "When the data has no rows, the lazy populator should not get called"
  describe lazy_loader([]).where { lazy_3 } do
    its("resource.lazy_3_call_count") { should be_zero }
  end
end

control "2370_fail_proc_handle_exception" do
  desc "An exception in a Proc should not derail the run"
  # TODO read exception
  describe lazy_loader(fresh_data.call).lazy_4s do
    its("count") { should cmp 0 }
  end
end
