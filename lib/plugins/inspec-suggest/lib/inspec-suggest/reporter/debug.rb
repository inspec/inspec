require_relative "base"
module InspecPlugins::Suggest
  module Reporter
    class Debug < Base
      def render

        controls_by_cat = {}

        run_data.profiles.each do |profile|
          profile.controls.each do |control|
            puts("-" * 20)
            puts "id: " + control.id
            puts "match?: " + (match?(control) ? "yes" : "no")
            puts "impact: " + control.impact.to_s
            puts "category: " + control.tags[:category]

            if match?(control)
              controls_by_cat[control.tags[:category]] ||= []
              controls_by_cat[control.tags[:category]] << control
            end
          end

          if controls_by_cat.empty?
            puts(("-" * 20) + " No Matches " + ("-" * 20))
          else
            puts(("-" * 20) + " Winners " + ("-" * 20))
            # Loop over matched categories. Sort results.
            controls_by_cat.each do |category, controls|
              controls.sort! { |a,b| a.impact <=> b.impact }
              puts "Category: #{category}"
              controls.each do |control|
                puts "\t#{control.impact}\t#{control.id}"
              end
            end
          end
        end
      end
    end
  end
end
