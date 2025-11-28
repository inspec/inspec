require "helper"
require "inspec/utils/profile_ast_helpers"

describe Inspec::Profile::AstHelper::InputCollectorBase do
  let(:memo) { { inputs: [] } }
  let(:collector) { Inspec::Profile::AstHelper::InputCollectorWithinControlBlock.new(memo) }

  describe "#extract_node_value" do
    it "extracts simple string values" do
      # Create a simple string node
      code = "'simple string'"
      ast = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f).ast

      result = collector.extract_node_value(ast)
      _(result).must_equal "simple string"
    end

    it "extracts numeric values" do
      code = "42"
      ast = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f).ast

      result = collector.extract_node_value(ast)
      _(result).must_equal 42
    end

    it "extracts array of strings" do
      code = <<~RUBY
        ["rhel-7-server-rpms/7Server/x86_64",#{" "}
         "rhel-7-server-rt-beta-rpms/x86_64",#{" "}
         "rhel-7-server-rt-rpms/7Server/x86_64"]
      RUBY
      ast = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f).ast

      result = collector.extract_node_value(ast)
      _(result).must_equal [
        "rhel-7-server-rpms/7Server/x86_64",
        "rhel-7-server-rt-beta-rpms/x86_64",
        "rhel-7-server-rt-rpms/7Server/x86_64",
      ]
    end

    it "extracts hash values" do
      code = '{ "key1" => "value1", "key2" => "value2" }'
      ast = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f).ast

      result = collector.extract_node_value(ast)
      _(result).must_equal({ "key1" => "value1", "key2" => "value2" })
    end

    it "extracts array containing hashes" do
      code = '[{ "health" => "not found" }, { "status" => "ok" }]'
      ast = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f).ast

      result = collector.extract_node_value(ast)
      _(result).must_equal [
        { "health" => "not found" },
        { "status" => "ok" },
      ]
    end

    it "extracts nested hash containing arrays" do
      code = '{ "repos" => ["repo1", "repo2"], "enabled" => true }'
      ast = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f).ast

      result = collector.extract_node_value(ast)
      _(result).must_equal({ "repos" => %w{repo1 repo2}, "enabled" => true })
    end

    it "extracts deeply nested structures" do
      code = <<~RUBY
        {#{" "}
          "array_of_hashes" => [
            { "name" => "item1", "values" => [1, 2, 3] },
            { "name" => "item2", "values" => [4, 5, 6] }
          ],
          "simple_key" => "simple_value"
        }
      RUBY
      ast = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f).ast

      result = collector.extract_node_value(ast)
      _(result).must_equal({
        "array_of_hashes" => [
          { "name" => "item1", "values" => [1, 2, 3] },
          { "name" => "item2", "values" => [4, 5, 6] },
        ],
        "simple_key" => "simple_value",
      })
    end

    it "handles boolean values" do
      code = "true"
      ast = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f).ast

      result = collector.extract_node_value(ast)
      _(result).must_equal true
    end

    it "handles nil values" do
      code = "nil"
      ast = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f).ast

      result = collector.extract_node_value(ast)
      _(result).must_be_nil
    end

    it "handles symbol values" do
      code = ":my_symbol"
      ast = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f).ast

      result = collector.extract_node_value(ast)
      _(result).must_equal :my_symbol
    end

    it "handles arrays with mixed types" do
      code = '["string", 42, true, nil, :symbol]'
      ast = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f).ast

      result = collector.extract_node_value(ast)
      _(result).must_equal ["string", 42, true, nil, :symbol]
    end
  end

  describe "#collect_input integration" do
    it "collects input with array value" do
      code = <<~RUBY
        input('excluded_repos',#{" "}
          value: ["rhel-7-server-rpms/7Server/x86_64",#{" "}
                  "rhel-7-server-rt-beta-rpms/x86_64"])
      RUBY
      ast = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f).ast

      collector.check_and_collect_input(ast)

      _(memo[:inputs].length).must_equal 1
      _(memo[:inputs][0][:name]).must_equal "excluded_repos"
      _(memo[:inputs][0][:options][:value]).must_equal [
        "rhel-7-server-rpms/7Server/x86_64",
        "rhel-7-server-rt-beta-rpms/x86_64",
      ]
    end

    it "collects input with hash value" do
      code = <<~RUBY
        input('config',#{" "}
          value: { "host" => "localhost", "port" => 8080 })
      RUBY
      ast = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f).ast

      collector.check_and_collect_input(ast)

      _(memo[:inputs].length).must_equal 1
      _(memo[:inputs][0][:name]).must_equal "config"
      _(memo[:inputs][0][:options][:value]).must_equal({ "host" => "localhost", "port" => 8080 })
    end

    it "collects input with array of hashes" do
      code = <<~RUBY
        input('checks',#{" "}
          value: [{ "health" => "not found" }, { "status" => "ok" }])
      RUBY
      ast = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f).ast

      collector.check_and_collect_input(ast)

      _(memo[:inputs].length).must_equal 1
      _(memo[:inputs][0][:name]).must_equal "checks"
      _(memo[:inputs][0][:options][:value]).must_equal [
        { "health" => "not found" },
        { "status" => "ok" },
      ]
    end

    it "collects input with complex nested structure" do
      code = <<~RUBY
        input('complex_config',#{" "}
          value: {
            "repos" => ["repo1", "repo2"],
            "settings" => { "enabled" => true, "count" => 5 }
          })
      RUBY
      ast = RuboCop::AST::ProcessedSource.new(code, RUBY_VERSION.to_f).ast

      collector.check_and_collect_input(ast)

      _(memo[:inputs].length).must_equal 1
      _(memo[:inputs][0][:name]).must_equal "complex_config"
      expected_value = {
        "repos" => %w{repo1 repo2},
        "settings" => { "enabled" => true, "count" => 5 },
      }
      _(memo[:inputs][0][:options][:value]).must_equal expected_value
    end
  end
end
