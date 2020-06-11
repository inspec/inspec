require "spec_helper"

describe Gyoku::XMLKey do

  describe ".create" do
    it "removes exclamation marks from the end of a String" do
      expect(create("value!")).to eq("value")
    end

    it "removes forward slashes from the end of a String" do
      expect(create("self-closing/")).to eq("self-closing")
    end

    it "does not convert snake_case Strings" do
      expect(create("lower_camel_case")).to eq("lower_camel_case")
    end

    it "converts snake_case Symbols to lowerCamelCase Strings" do
      expect(create(:lower_camel_case)).to eq("lowerCamelCase")
      expect(create(:lower_camel_case!)).to eq("lowerCamelCase")
    end

    context "when the converter option is set to camelcase" do
      it "should replace / with ::, and turn snake case into camel case" do
        input = "hello_world_bob/how_are_you|there:foo^bar".to_sym
        expected_output = "HelloWorldBob::HowAreYou|there:foo^bar"
        expect(create(input, {key_converter: :camelcase})).to eq(expected_output)
      end
    end

    context "with key_converter" do
      it "accepts lambda converters" do
        expect(create(:some_text, {key_converter: lambda { |k| k.reverse }})).to eq("txet_emos")
      end

      it "convert symbol to the specified type" do
        expect(create(:some_text, {key_converter: :camelcase})).to eq("SomeText")
        expect(create(:some_text, {key_converter: :upcase})).to eq("SOME_TEXT")
        expect(create(:some_text, {key_converter: :none})).to eq("some_text")
      end

      it "when key_to_convert is defined, convert only this key" do
        options = {key_converter: :camelcase, key_to_convert: 'somekey'}
        expect(create(:some_key, options)).to eq("someKey")

        options = {key_converter: :camelcase, key_to_convert: 'some_key'}
        expect(create(:some_key, options)).to eq("SomeKey")
      end

      it "when except is defined, dont convert this key" do
        options = {key_converter: :camelcase, except: 'some_key'}
        expect(create(:some_key, options)).to eq("someKey")
      end
    end

    context "with :element_form_default set to :qualified and a :namespace" do
      it "adds the given namespace" do
        key = create :qualify, :element_form_default => :qualified, :namespace => :v1
        expect(key).to eq("v1:qualify")
      end

      it "does not add the given namespace if the key starts with a colon" do
        key = create ":qualify", :element_form_default => :qualified, :namespace => :v1
        expect(key).to eq("qualify")
      end

      it "adds a given :namespace after converting the key" do
        key = create :username, :element_form_default => :qualified, :namespace => :v1, :key_converter => :camelcase
        expect(key).to eq("v1:Username")
      end
    end
  end

  def create(key, options = {})
    Gyoku::XMLKey.create(key, options)
  end

end
