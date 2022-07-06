module InspecPlugins::Suggest
  class Checker

    # name => class
    @@check_classes = {}

    def self.register_check(check_name, check_class)
      @@check_classes[check_name] = check_class
    end

    attr_reader :config, :ui

    def initialize(opts)
      @config = opts[:config]
      @ui = opts[:ui]

      # Delete globally disabled checks
      if opts[:cli_options][:disable_check]
        opts[:cli_options][:disable_check].each do |check_name|
          if @@check_classes.key?(check_name)
            # ui.debug "check: globally disabling check '#{check_name}'"
            @@check_classes.delete(check_name)
          else
            ui.error "check: Attempt to disable nonexistant rule '#{check_name}'"
            ui.exit(:usage_error)
          end
        end
      end
    end

    def each_check(set_name, &block)
      @@check_classes.each do |check_name, check_class|
        next if (config.dig("sets", set_name, "check", "disable-checks") || []).include? check_name

        check = check_class.new(ui: ui)
        yield(check)
      end
    end
  end
end

# Order matters! Load order determines execution order
require_relative "checker/syntax"           # must run first
require_relative "checker/trailing_newline"
require_relative "checker/load_as_json"
require_relative "checker/control_id"       # must run after load_as_json
require_relative "checker/resource_type"    # must run after load_as_json
require_relative "checker/root_path_input" # must run after load_as_json
require_relative "checker/category_tag"     # must run after load_as_json
