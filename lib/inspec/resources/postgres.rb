# copyright: 2015, Vulcano Security GmbH

module Inspec::Resources
  class Postgres < Inspec.resource(1)
    name "postgres"
    supports platform: "unix"
    desc "The 'postgres' resource is a helper for the 'postgres_conf', 'postgres_hba_conf', 'postgres_ident_conf' & 'postgres_session' resources.  Please use those instead."

    attr_reader :service, :data_dir, :conf_dir, :conf_path, :version, :cluster
    def initialize
      # determine dirs and service based on versions
      determine_dirs
      determine_service

      # print warnings if the dirs do not exist
      verify_dirs

      if !@version.to_s.empty? && !@conf_dir.to_s.empty?
        @conf_path = File.join @conf_dir, "postgresql.conf"
      else
        @conf_path = nil
        return skip_resource "Seems like PostgreSQL is not installed on your system"
      end
    end

    def to_s
      "PostgreSQL"
    end

    private

    def determine_dirs
      if inspec.os.debian?
        #
        # https://wiki.debian.org/PostgreSql
        #
        # Debian allows multiple versions of postgresql to be
        # installed as well as multiple "clusters" to be configured.
        #
        @version = version_from_psql || version_from_dir("/etc/postgresql")
        unless @version.to_s.empty?
          @cluster = cluster_from_dir("/etc/postgresql/#{@version}")
          @conf_dir = "/etc/postgresql/#{@version}/#{@cluster}"
          @data_dir = "/var/lib/postgresql/#{@version}/#{@cluster}"
        end
      else
        @version = version_from_psql
        if @version.to_s.empty?
          if inspec.directory("/var/lib/pgsql/data").exist?
            warn "Unable to determine PostgreSQL version: psql did not return" \
                 "a version number and unversioned data directories were found."
          else
            @version = version_from_dir("/var/lib/pgsql")
          end
        end
        @data_dir = locate_data_dir_location_by_version(@version)
      end
      @conf_dir ||= @data_dir
    end

    def determine_service
      @service = "postgresql"
      if @version.to_i >= 10
        @service += "-#{@version.to_i}"
      elsif @version.to_f >= 9.4
        @service += "-#{@version}"
      end
    end

    def verify_dirs
      unless inspec.directory(@conf_dir).exist?
        warn "Default postgresql configuration directory: #{@conf_dir} does not exist. " \
          "Postgresql may not be installed or we've misidentified the configuration " \
          "directory."
      end

      unless inspec.directory(@data_dir).exist?
        warn "Default postgresql data directory: #{@data_dir} does not exist. " \
          "Postgresql may not be installed or we've misidentified the data " \
          "directory."
      end
    end

    def version_from_psql
      return unless inspec.command("psql").exist?

      inspec.command("psql --version | awk '{ print $NF }' | awk -F. '{ print $1\".\"$2 }'").stdout.strip
    end

    def locate_data_dir_location_by_version(ver = @version)
      dir_list = [
        "/var/lib/pgsql/#{ver}/data",
        # for 10, the versions are just stored in `10` although their version `10.7`
        "/var/lib/pgsql/#{ver.to_i}/data",
        "/var/lib/pgsql/data",
        "/var/lib/postgres/data",
        "/var/lib/postgresql/data",
      ]

      data_dir_loc = dir_list.detect { |i| inspec.directory(i).exist? }

      if data_dir_loc.nil?
        warn 'Unable to find the PostgreSQL data_dir in expected location(s), please
        execute "psql -t -A -p <port> -h <host> -c "show hba_file";" as the PostgreSQL
        DBA to find the non-standard data_dir location.'
      end
      data_dir_loc
    end

    def version_from_dir(dir)
      dirs = inspec.command("ls -d #{dir}/*/").stdout
      entries = dirs.lines.count
      case entries
      when 0
        warn "Could not determine version of installed postgresql by inspecting #{dir}"
        nil
      when 1
        warn "Using #{dirs}: #{dir_to_version(dirs)}"
        dir_to_version(dirs)
      else
        warn "Multiple versions of postgresql installed or incorrect base dir #{dir}"
        first = dir_to_version(dirs.lines.first)
        warn "Using the first version found: #{first}"
        first
      end
    end

    def dir_to_version(dir)
      dir.chomp.split("/").last
    end

    def cluster_from_dir(dir)
      # Main is the default cluster name on debian use it if it
      # exists.
      if inspec.directory("#{dir}/main").exist?
        "main"
      else
        dirs = inspec.command("ls -d #{dir}/*/").stdout.lines
        if dirs.empty?
          warn "No postgresql clusters configured or incorrect base dir #{dir}"
          return nil
        end
        first = dirs.first.chomp.split("/").last
        if dirs.count > 1
          warn "Multiple postgresql clusters configured or incorrect base dir #{dir}"
          warn "Using the first directory found: #{first}"
        end
        first
      end
    end
  end
end
