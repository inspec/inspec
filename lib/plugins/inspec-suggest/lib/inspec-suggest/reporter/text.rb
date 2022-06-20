require_relative "base"
module InspecPlugins::Suggest
  module Reporter
    class Text < Base
      def render

        controls_by_cat = {}

        run_data.profiles.each do |profile|
          profile.controls.each do |control|
            if match?(control)
              controls_by_cat[control.tags[:category]] ||= []
              controls_by_cat[control.tags[:category]] << control
            end
          end
        end

        if controls_by_cat.empty?
          puts "Sorry, no recommendations at this time."
        else
          puts "Recommendations:"
          # Loop over matched categories. Sort results.
          controls_by_cat.each do |category, controls|
            controls.sort! { |a,b| a.impact <=> b.impact }
            puts "Category: #{category.upcase}"
            controls.each do |control|
              puts "\t#{control.id}"
            end
          end
        end
      end
    end
  end
end
