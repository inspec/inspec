require 'spec_helper'

describe "when testing path helpers" do
  it "should define Libyajl2::VENDORED_LIBYAJL2_DIR" do
    expect(Libyajl2::VENDORED_LIBYAJL2_DIR).to include("lib/libyajl2/vendored-libyajl2")
  end

  it "should define Libyajl2.opt_path" do
    expect(Libyajl2.opt_path).to include("lib/libyajl2/vendored-libyajl2/lib")
  end

  it "should define Libyajl2.include_path" do
    expect(Libyajl2.include_path).to include("lib/libyajl2/vendored-libyajl2/include")
  end

  %w{yajl_common.h yajl_gen.h yajl_parse.h yajl_tree.h yajl_version.h}.each do |hdr|
    it "should copy the #{hdr} header file to the gem path" do
      expect(File.exist?(File.join(Libyajl2.include_path, "yajl", hdr))).to be_true
    end
  end
end
