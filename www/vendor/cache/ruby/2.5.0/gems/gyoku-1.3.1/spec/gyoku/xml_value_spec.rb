require "spec_helper"

describe Gyoku::XMLValue do

  describe ".create" do
    context "for DateTime objects" do
      it "returns an xs:dateTime compliant String" do
        expect(create(DateTime.new(2012, 03, 22, 16, 22, 33))).to eq("2012-03-22T16:22:33+00:00")
      end
    end

    context "for Date objects" do
      it "returns an xs:date compliant String" do
        expect(create(Date.new(2012, 03, 22))).to eq("2012-03-22")
      end
    end

    context "for Time objects" do
      it "returns an xs:time compliant String" do
        expect(create(Time.local(2012, 03, 22, 16, 22, 33))).to eq("16:22:33")
      end
    end

    it "returns the String value and escapes special characters" do
      expect(create("string")).to eq("string")
      expect(create("<tag>")).to eq("&lt;tag&gt;")
      expect(create("at&t")).to eq("at&amp;t")
      expect(create('"quotes"')).to eq("&quot;quotes&quot;")
    end

    it "returns the String value without escaping special characters" do
      expect(create("<tag>", false)).to eq("<tag>")
    end

    it "returns an xs:dateTime compliant String for Objects responding to #to_datetime" do
      singleton = Object.new
      def singleton.to_datetime
        DateTime.new 2012, 03, 22, 16, 22, 33
      end

      expect(create(singleton)).to eq("2012-03-22T16:22:33+00:00")
    end

    it "calls Proc objects and converts their return value" do
      object = lambda { DateTime.new 2012, 03, 22, 16, 22, 33 }
      expect(create(object)).to eq("2012-03-22T16:22:33+00:00")
    end

    it "hash objects get converted to xml" do
      object = { document!: { "@version" => "2.0", content!: { key!: "value", other_key: { "@attribute" => 'value', content!: { key: "value" } } } } }
      expect(create(object)).to eq("<document version=\"2.0\"><key>value</key><otherKey attribute=\"value\"><key>value</key></otherKey></document>")
    end

    it "calls #to_s unless the Object responds to #to_datetime" do
      expect(create("value")).to eq("value")
    end
  end

  def create(object, escape_xml = true)
    Gyoku::XMLValue.create object, escape_xml
  end

end
