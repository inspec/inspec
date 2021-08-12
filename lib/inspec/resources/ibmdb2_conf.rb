module Inspec::Resources
  class Ibmdb2Conf < Inspec.resource(1)
    name "ibmdb2_conf"

    supports platform: "unix"
    supports platform: "windows"

    desc "Use the ibmdb2_conf InSpec audit resource to test the configuration values of IBM Db2 database."
    example <<~EXAMPLE
      describe ibmdb2_conf(db2_executable_file_path: "path_to_db2_binary", db_instance: "db2inst1") do
        its("output") { should_not be_empty }
        its("output") { should include("Audit buffer size (4KB) (AUDIT_BUF_SZ) = 0")}
      end
    EXAMPLE

    attr_reader :output

    def initialize(opts = {})
      if inspec.os.platform?("unix")
        @db2_executable_file_path = opts[:db2_executable_file_path]
        @db_instance = opts[:db_instance]
        raise Inspec::Exceptions::ResourceFailed, "Can't connect to IBM DB2 without db2_executable_file_path, db_instance options provided." if @db2_executable_file_path.nil? || @db_instance.nil?
      end
      @output = run_command
    end

    def to_s
      "IBM Db2 Conf"
    end

    private

    def run_command
      # attach to the db2 instance and get the configuration
      if inspec.os.platform?("unix")
        cmd = inspec.command("#{@db2_executable_file_path} attach to #{@db_instance}\; #{@db2_executable_file_path} get database manager configuration")
        out = cmd.stdout + "\n" + cmd.stderr

        # check if following specific error is there. Sourcing the db2profile to resolve the error.
        if cmd.exit_status != 0 && out =~ /SQL10007N Message "-1390" could not be retrieved.  Reason code: "3"/
          cmd = inspec.command(". ~/sqllib/db2profile\; #{@db2_executable_file_path} attach to #{@db_instance}\; #{@db2_executable_file_path} get database manager configuration")
          out = cmd.stdout + "\n" + cmd.stderr
        end
      elsif inspec.os.platform?("windows")
        # set-item command set the powershell to run the db2 commands.
        cmd = inspec.command("set-item -path env:DB2CLP -value \"**$$**\"\; db2 get database manager configuration")
        out = cmd.stdout + "\n" + cmd.stderr
      end

      if cmd.exit_status != 0 || out =~ /Can't connect to IBM Db2 server/ || out.downcase =~ /^error:.*/
        raise Inspec::Exceptions::ResourceFailed, "IBM Db2 query with error: #{out}"
      else
        cmd.stdout.gsub(/\n|\r/, ",").split(",").reject { |n| n.nil? || n.empty? }.map { |n| n.strip.gsub!(/\s+/, " ") }
      end
    end
  end
end
