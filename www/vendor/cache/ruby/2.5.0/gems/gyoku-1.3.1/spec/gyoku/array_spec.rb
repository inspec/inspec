require "spec_helper"

describe Gyoku::Array do

  describe ".to_xml" do
    it "returns the XML for an Array of Hashes" do
      array = [{ :name => "adam" }, { :name => "eve" }]
      result = "<user><name>adam</name></user><user><name>eve</name></user>"

      expect(to_xml(array, "user")).to eq(result)
    end

    it "returns the XML for an Array of Hashes unwrapped" do
      array = [{ :name => "adam" }, { :name => "eve" }]
      result = "<user><name>adam</name><name>eve</name></user>"

      expect(to_xml(array, "user", true, {}, :unwrap => true)).to eq(result)
    end

    it "returns the XML for an Array of different Objects" do
      array = [:symbol, "string", 123]
      result = "<value>symbol</value><value>string</value><value>123</value>"

      expect(to_xml(array, "value")).to eq(result)
    end

    it "defaults to escape special characters" do
      array = ["<tag />", "adam & eve"]
      result = "<value>&lt;tag /&gt;</value><value>adam &amp; eve</value>"

      expect(to_xml(array, "value")).to eq(result)
    end

    it "does not escape special characters when told to" do
      array = ["<tag />", "adam & eve"]
      result = "<value><tag /></value><value>adam & eve</value>"

      expect(to_xml(array, "value", false)).to eq(result)
    end

    it "adds attributes to a given tag" do
      array = ["adam", "eve"]
      result = '<value active="true">adam</value><value active="true">eve</value>'

      expect(to_xml(array, "value", :escape_xml, :active => true)).to eq(result)
    end

    it "adds attributes to duplicate tags" do
      array = ["adam", "eve"]
      result = '<value id="1">adam</value><value id="2">eve</value>'

      expect(to_xml(array, "value", :escape_xml, :id => [1, 2])).to eq(result)
    end

    it "skips attribute for element without attributes if there are fewer attributes than elements" do
      array = ["adam", "eve", "serpent"]
      result = '<value id="1">adam</value><value id="2">eve</value><value>serpent</value>'

      expect(to_xml(array, "value", :escape_xml, :id => [1, 2])).to eq(result)
    end

    it "handles nested Arrays" do
      array = [["one", "two"]]
      result = "<value><element>one</element><element>two</element></value>"

      expect(to_xml(array, "value")).to eq(result)
    end
  end

  def to_xml(*args)
    Gyoku::Array.to_xml *args
  end

end
