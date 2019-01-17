title "Verify default methods are defined - issue 3103"

fresh_data = ->() do
  [
    { row_id: 0, color: :red   }.dup,
    { row_id: 1, color: :blue  }.dup,
    { row_id: 2, color: :green }.dup,
  ]
end

control "3103_where_defined" do
  desc "The where filter method should be defined on both the resource and table"
  describe default_methods_demo(fresh_data.call) do
    it { should respond_to :where }
  end

  describe default_methods_demo(fresh_data.call).where(color: :red) do
    it { should respond_to :where }
    it { should be_a_kind_of FilterTable::Table }
  end
end

control "3103_entries_defined" do
  desc "The entries method should be defined on both the resource and table"
  describe default_methods_demo(fresh_data.call) do
    it { should respond_to :entries }
  end

  describe default_methods_demo(fresh_data.call).entries do
    it { should be_a_kind_of Array }
    its("first") { should be_a_kind_of Struct }
    its("count") { should eq 3 }
  end

  describe default_methods_demo(fresh_data.call).where(color: :red).entries do
    it { should be_a_kind_of Array }
    its("first") { should be_a_kind_of Struct }
    its("count") { should eq 1 }
  end
end

control "3103_raw_data_defined" do
  desc "The raw_data method should be defined on both the resource and table"
  describe default_methods_demo(fresh_data.call) do
    it { should respond_to :raw_data }
  end

  describe default_methods_demo(fresh_data.call).raw_data do
    it { should be_a_kind_of Array }
    its("first") { should be_a_kind_of Hash }
    its("count") { should eq 3 }
  end

  describe default_methods_demo(fresh_data.call).where(color: :red).raw_data do
    it { should be_a_kind_of Array }
    its("first") { should be_a_kind_of Hash }
    its("count") { should eq 1 }
  end
end

control "3103_exist_defined" do
  desc "The exist method should be defined on both the resource and table"
  describe default_methods_demo(fresh_data.call) do
    it { should respond_to :exist? }
    it { should exist }
  end

  describe default_methods_demo(fresh_data.call).exist? do
    it { should be_a_kind_of TrueClass }
  end

  describe default_methods_demo(fresh_data.call).where(color: :red) do
    it { should respond_to :exist? }
    it { should exist }
  end

  describe default_methods_demo(fresh_data.call).where(color: :red).exist? do
    it { should be_a_kind_of TrueClass }
  end
end

control "3103_count_defined" do
  desc "The count method should be defined on both the resource and table"
  describe default_methods_demo(fresh_data.call) do
    it { should respond_to :count }
    its("count") { should eq 3 }
  end

  describe default_methods_demo(fresh_data.call).count do
    it { should be_a_kind_of Integer }
    it { should eq 3 }
  end

  describe default_methods_demo(fresh_data.call).where(color: :red) do
    it { should respond_to :count }
    its("count") { should eq 1 }
  end

  describe default_methods_demo(fresh_data.call).where(color: :red).count do
    it { should be_a_kind_of Integer }
    it { should eq 1 }
  end
end
