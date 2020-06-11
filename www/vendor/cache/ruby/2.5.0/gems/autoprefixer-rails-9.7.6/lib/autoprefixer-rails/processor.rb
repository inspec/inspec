require "pathname"
require "execjs"
require "json"

IS_SECTION = /^\s*\[(.+)\]\s*$/

module AutoprefixerRails
  # Ruby to JS wrapper for Autoprefixer processor instance
  class Processor
    def initialize(params = {})
      @params = params || {}
    end

    # Process `css` and return result.
    #
    # Options can be:
    # * `from` with input CSS file name. Will be used in error messages.
    # * `to` with output CSS file name.
    # * `map` with true to generate new source map or with previous map.
    def process(css, opts = {})
      opts = convert_options(opts)

      apply_wrapper =
        "(function(opts, pluginOpts) {" \
        "return eval(process.apply(this, opts, pluginOpts));" \
        "})"

      plugin_opts = params_with_browsers(opts[:from]).merge(opts)
      process_opts = {
        from: plugin_opts.delete(:from),
        to: plugin_opts.delete(:to),
        map: plugin_opts.delete(:map),
      }

      begin
        result = runtime.call(apply_wrapper, [css, process_opts, plugin_opts])
      rescue ExecJS::ProgramError => e
        contry_error = "BrowserslistError: " \
          "Country statistics is not supported " \
          "in client-side build of Browserslist"
        if e.message == contry_error
          raise "Country statistics is not supported in AutoprefixerRails. " \
            "Use Autoprefixer with webpack or other Node.js builder."
        else
          raise e
        end
      end

      Result.new(result["css"], result["map"], result["warnings"])
    end

    # Return, which browsers and prefixes will be used
    def info
      runtime.eval("autoprefixer(#{js_params}).info()")
    end

    # Parse Browserslist config
    def parse_config(config)
      sections = {"defaults" => []}
      current  = "defaults"
      config.gsub(/#[^\n]*/, "")
        .split(/\n/)
        .map(&:strip)
        .reject(&:empty?)
        .each do |line|
        if IS_SECTION =~ line
          current = line.match(IS_SECTION)[1].strip
          sections[current] ||= []
        else
          sections[current] << line
        end
      end
      sections
    end

    private

    def params_with_browsers(from = nil)
      from ||= if defined?(Rails) && Rails.respond_to?(:root) && Rails.root
        Rails.root.join("app/assets/stylesheets").to_s
      else
        "."
      end

      params = @params
      if !params.key?(:browsers) && !params.key?(:overrideBrowserslist) && from
        file = find_config(from)
        if file
          env    = params[:env].to_s || "development"
          config = parse_config(file)
          params = params.dup
          params[:overrideBrowserslist] = (config[env] || config["defaults"])
        end
      end

      params
    end

    # Convert params to JS string and add browsers from Browserslist config
    def js_params
      "{ " +
        params_with_browsers.map { |k, v| "#{k}: #{v.inspect}"}.join(", ") +
        " }"
    end

    # Convert ruby_options to jsOptions
    def convert_options(opts)
      converted = {}

      opts.each_pair do |name, value|
        if /_/ =~ name
          name = name.to_s.gsub(/_\w/) { |i| i.delete("_").upcase }.to_sym
        end
        value = convert_options(value) if value.is_a? Hash
        converted[name] = value
      end

      converted
    end

    # Try to find Browserslist config
    def find_config(file)
      path = Pathname(file).expand_path

      while path.parent != path
        config1 = path.join("browserslist")
        return config1.read if config1.exist? && !config1.directory?

        config2 = path.join(".browserslistrc")
        return config2.read if config2.exist? && !config1.directory?

        path = path.parent
      end

      nil
    end

    # Lazy load for JS library
    def runtime
      @runtime ||= begin
        if ExecJS.eval("typeof Uint8Array") != "function"
          if ExecJS.runtime.name.start_with?("therubyracer")
            raise "ExecJS::RubyRacerRuntime is not supported. " \
              "Please replace therubyracer with mini_racer " \
              "in your Gemfile or use Node.js as ExecJS runtime."
          else
            raise "#{ExecJS.runtime.name} runtime does’t support ES6. " \
              "Please update or replace your current ExecJS runtime."
          end
        end

        if ExecJS.runtime == ExecJS::Runtimes::Node
          version = ExecJS.runtime.eval("process.version")
          first = version.match(/^v(\d+)/)[1].to_i
          if first < 6
            raise "Autoprefixer doesn’t support Node #{version}. Update it."
          end
        end

        ExecJS.compile(build_js)
      end
    end

    # Cache autoprefixer.js content
    def read_js
      @@js ||= begin
        root = Pathname(File.dirname(__FILE__))
        path = root.join("../../vendor/autoprefixer.js")
        path.read
      end
    end

    # Return processor JS with some extra methods
    def build_js
      "var global = this;" + read_js + process_proxy
    end

    # Return JS code for process method proxy
    def process_proxy
      <<-JS
        var processor;
        var process = function() {
          var result = autoprefixer.process.apply(autoprefixer, arguments);
          var warns  = result.warnings().map(function (i) {
            delete i.plugin;
            return i.toString();
          });
          var map = result.map ? result.map.toString() : null;
          return { css: result.css, map: map, warnings: warns };
        };
      JS
    end
  end
end
