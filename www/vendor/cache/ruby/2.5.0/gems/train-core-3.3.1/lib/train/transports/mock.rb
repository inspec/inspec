require_relative "../plugins"
require "digest"

module Train::Transports
  class Mock < Train.plugin(1)
    name "mock"

    def initialize(conf = nil)
      @conf = conf || {}
      trace_calls if @conf[:trace]
    end

    def connection
      @connection ||= Connection.new(@conf)
    end

    def to_s
      "Mock Transport"
    end

    private

    def trace_calls
      interface_methods = {
        "Train::Transports::Mock" =>
          Train::Transports::Mock.instance_methods(false),
        "Train::Transports::Mock::Connection" =>
          Connection.instance_methods(false),
        "Train::Transports::Mock::Connection::File" =>
          Connection::FileCommon.instance_methods(false),
        "Train::Transports::Mock::Connection::OS" =>
          Train::Platform.instance_methods(false),
      }

      # rubocop:disable Metrics/ParameterLists
      # rubocop:disable Security/Eval
      set_trace_func(proc { |event, _file, _line, id, binding, classname|
        unless classname.to_s.start_with?("Train::Transports::Mock") &&
            (event == "call") &&
            interface_methods[classname.to_s].include?(id)
          next
        end

        # kindly borrowed from the wonderful simple-tracer by matugm
        arg_names = eval(
          "method(__method__).parameters.map { |arg| arg[1].to_s }",
          binding
        )
        args = eval("#{arg_names}.map { |arg| eval(arg) }", binding).join(", ")
        prefix = "-" * (classname.to_s.count(":") - 2) + "> "
        puts("#{prefix}#{id} #{args}")
      })
      # rubocop:enable all
    end
  end
end

class Train::Transports::Mock
  class Connection < BaseConnection
    attr_reader :options

    def initialize(conf = nil)
      super(conf)
      mock_os
      enable_cache(:file)
      enable_cache(:command)
    end

    def uri
      "mock://"
    end

    DEFAULTS = {
      name: "mock",
      family: "mock",
      release: "unknown",
      arch: "unknown",
    }.freeze

    def mock_os(value = {})
      value = DEFAULTS
        .merge(value || {})
        .transform_values { |v| v || "unknown" }

      platform = Train::Platforms.name(value[:name])
      platform.find_family_hierarchy
      platform.platform = value
      platform.add_platform_methods
      @platform = platform
    end

    def commands=(commands)
      @cache[:command] = commands
    end

    def commands
      @cache[:command]
    end

    def files=(files)
      @cache[:file] = files
    end

    def files
      @cache[:file]
    end

    def mock_command(cmd, stdout = nil, stderr = nil, exit_status = 0)
      @cache[:command][cmd] = Command.new(stdout || "", stderr || "", exit_status)
    end

    def command_not_found(cmd)
      if @options[:verbose]
        $stderr.puts("Command not mocked:")
        $stderr.puts("    " + cmd.to_s.split("\n").join("\n    "))
        $stderr.puts("    SHA: " + Digest::SHA256.hexdigest(cmd.to_s))
      end
      # return a non-zero exit code
      mock_command(cmd, nil, nil, 1)
    end

    def file_not_found(path)
      $stderr.puts("File not mocked: " + path.to_s) if @options[:verbose]
      File.new(self, path)
    end

    def to_s
      "Mock Connection"
    end

    private

    def run_command_via_connection(cmd, &_data_handler)
      @cache[:command][Digest::SHA256.hexdigest cmd.to_s] ||
        command_not_found(cmd)
    end

    def file_via_connection(path)
      file_not_found(path)
    end
  end
end

class Train::Transports::Mock::Connection
  Command = Struct.new(:stdout, :stderr, :exit_status)
end

class Train::Transports::Mock::Connection
  class File < Train::File
    def self.from_json(json)
      res = new(json["backend"],
        json["path"],
        json["follow_symlink"])
      res.type = json["type"]
      Train::File::DATA_FIELDS.each do |f|
        m = (f.tr("?", "") + "=").to_sym
        res.method(m).call(json[f])
      end
      res
    end

    Train::File::DATA_FIELDS.each do |m|
      attr_accessor m.tr("?", "").to_sym
      next unless m.include?("?")

      define_method m.to_sym do
        method(m.tr("?", "").to_sym).call
      end
    end
    attr_accessor :type

    def initialize(backend, path, follow_symlink = true)
      super(backend, path, follow_symlink)
      @type = :unknown
      @exist = false
    end

    def mounted
      @mounted ||=
        @backend.run_command("mount | grep -- ' on #{@path}'")
    end
  end
end
