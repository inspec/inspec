module Inspec::Resources
  class Lines
    attr_reader :output

    def initialize(raw, desc)
      @output = raw
      @desc = desc
    end

    def to_s
      @desc
    end
  end

  class Ibmdb2Session < Inspec.resource(1)
    name "ibmdb2_session"

    supports platform: "unix"
    supports platform: "windows"

    desc "Use the ibmdb2_session InSpec audit resource to test SQL commands run against a IBM Db2 database."
    example <<~EXAMPLE
      describe ibmdb2_session(db2_executable_file_path: "path_to_db2_binary", db_instance: "db2inst1", db_name: "sample").query('list database directory') do
        its('output') { should_not match(/sample/) }
      end
    EXAMPLE

    def initialize(opts = {})
      @db_name = opts[:db_name]
      if inspec.os.platform?("unix")
        @db2_executable_file_path = opts[:db2_executable_file_path]
        @db_instance = opts[:db_instance]
        raise Inspec::Exceptions::ResourceFailed, "Can't run IBM DB2 queries without db2_executable_file_path, db_instance, db_name options provided." if @db2_executable_file_path.nil? || @db_instance.nil? || @db_name.nil?
      elsif inspec.os.platform?("windows")
        raise Inspec::Exceptions::ResourceFailed, "Can't run IBM DB2 queries without db_name option provided." if @db_name.nil?
      end
    end

    def query(q)
      raise Inspec::Exceptions::ResourceFailed, "#{resource_exception_message}" if resource_failed?

      if inspec.os.platform?("unix")
        # connect to the db and query on the database
        cmd = inspec.command("#{@db2_executable_file_path} attach to #{@db_instance}\; #{@db2_executable_file_path} connect to #{@db_name}\; #{@db2_executable_file_path} #{q}\;")
        out = cmd.stdout + "\n" + cmd.stderr

        # check if following specific error is there. Sourcing the db2profile to resolve the error.
        if cmd.exit_status != 0 && out =~ /SQL10007N Message "-1390" could not be retrieved.  Reason code: "3"/
          cmd = inspec.command(". ~/sqllib/db2profile\; #{@db2_executable_file_path} attach to #{@db_instance}\; #{@db2_executable_file_path} connect to #{@db_name}\; #{@db2_executable_file_path} #{q}\;")
          out = cmd.stdout + "\n" + cmd.stderr
        end
      elsif inspec.os.platform?("windows")
        # set-item command set the powershell to run the db2 commands.
        cmd = inspec.command("set-item -path env:DB2CLP -value \"**$$**\"\; db2 connect to #{@db_name}\; db2 #{q}\;")
        out = cmd.stdout + "\n" + cmd.stderr
      end

      if cmd.exit_status != 0 || out =~ /Can't connect to IBM Db2 / || out.downcase =~ /^error:.*/
        raise Inspec::Exceptions::ResourceFailed, "IBM Db2 connection error: #{out}"
      else
        Lines.new(cmd.stdout.strip, "IBM Db2 Query: #{q}")
      end
    end

    def to_s
      "IBM Db2 Session"
    end
  end
end
