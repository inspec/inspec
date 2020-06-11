RSpec.describe "spec_helper.rb" do
  let(:spec_dir) { __dir__ }
  let(:root_dir) { File.expand_path File.join(spec_dir, "..") }
  let(:lib_dir) { File.expand_path File.join(root_dir, "lib") }

  describe "spec_dir" do
    it "is already in $LOAD_PATH" do
      expect($LOAD_PATH).to include spec_dir
    end
  end

  describe "lib_dir" do
    it "is already in $LOAD_PATH" do
      expect($LOAD_PATH).to include lib_dir
    end
  end
end
