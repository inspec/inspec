require_relative "base"

module InspecPlugins::Suggest
  class Checker::Check
    class CategoryTag < Base
      name "category-tag"

      CATEGORIES = %w{
        os
        app
        db
      }.freeze

      def run(file)
        tags = file[:as_json]["controls"][0]["tags"]

        unless tags.is_a? Hash
          file[:errors] << "Tags field did not end up as a Hash somehow, check formatting"
          return false
        end

        unless tags.key?("category")
          file[:errors] << "Missing 'category' tag"
          return false
        end

        category = tags["category"]
        unless CATEGORIES.include?(category)
          file[:warnings] << "Category value '#{category}' not recognized (valid: #{CATEGORIES.join(", ")})"
          return true
        end

        true
      end
    end
  end
end
