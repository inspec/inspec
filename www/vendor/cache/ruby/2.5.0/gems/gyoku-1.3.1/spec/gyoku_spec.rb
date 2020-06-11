require "spec_helper"

describe Gyoku do

  describe ".xml_tag" do
    it "translates Symbols to lowerCamelCase by default" do
      tag = Gyoku.xml_tag(:user_name)
      expect(tag).to eq("userName")
    end

    it "does not translate Strings" do
      tag = Gyoku.xml_tag("user_name")
      expect(tag).to eq("user_name")
    end

    it "translates Symbols by a given key_converter" do
      tag = Gyoku.xml_tag(:user_name, :key_converter => :upcase)
      expect(tag).to eq("USER_NAME")
    end

    it "does not translates Strings with a given key_converter" do
      tag = Gyoku.xml_tag("user_name", :key_converter => :upcase)
      expect(tag).to eq("user_name")
    end
  end

  describe ".xml" do
    it "translates a given Hash to XML" do
      hash = { :id => 1 }
      xml = Gyoku.xml(hash, :element_form_default => :qualified)

      expect(xml).to eq("<id>1</id>")
    end

    it "accepts a key_converter for the Hash keys" do
      hash = { :user_name => "finn", :pass_word => "secret" }
      xml = Gyoku.xml(hash, {key_converter: :upcase})

      expect(xml).to include("<USER_NAME>finn</USER_NAME>")
      expect(xml).to include("<PASS_WORD>secret</PASS_WORD>")
    end

    it "don't converts Strings keys" do
      hash = { :user_name => "finn", "pass_word" => "secret" }
      xml = Gyoku.xml(hash, {key_converter: :upcase})

      expect(xml).to include("<USER_NAME>finn</USER_NAME>")
      expect(xml).to include("<pass_word>secret</pass_word>")
    end

    it "when defined key_to_convert only convert this key" do
      hash = { user_name: "finn", pass_word: "secret" }
      options = {key_converter: :upcase, key_to_convert: 'user_name'}
      xml = Gyoku.xml(hash, options)

      expect(xml).to include("<USER_NAME>finn</USER_NAME>")
      expect(xml).to include("<passWord>secret</passWord>")
    end

    it "accepts key_converter for nested hash" do
      hash = { user: { user_name: "finn", pass_word: "secret" }}
      xml = Gyoku.xml(hash, {key_converter: :upcase})

      expect(xml).to include("<USER><USER_NAME>finn</USER_NAME>")
      expect(xml).to include("<PASS_WORD>secret</PASS_WORD></USER>")
    end

    it "does not modify the original Hash" do
      hash = {
        :person => {
          :first_name => "Lucy",
          :last_name => "Sky",
          :order! => [:first_name, :last_name]
        },
        :attributes! => { :person => { :id => "666" } }
      }
      original_hash = hash.dup

      Gyoku.xml(hash)
      expect(original_hash).to eq(hash)
    end
  end

end
