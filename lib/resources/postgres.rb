# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Dominik Richter
# author: Christoph Hartmann
# author: Aaron Lippold

module Inspec::Resources
  class Postgres < Inspec.resource(1)
    name 'postgres'

    attr_reader :service, :data_dir, :conf_dir, :conf_path, :version, :cluster
    def initialize
      if inspec.os.debian?
        #
        # https://wiki.debian.org/PostgreSql
        #
        # Debian allows multiple versions of postgresql to be
        # installed as well as multiple "clusters" to be configured.
        #
        @version = version_from_psql || version_from_dir('/etc/postgresql')
        @cluster = cluster_from_dir("/etc/postgresql/#{@version}")
        @conf_dir = "/etc/postgresql/#{@version}/#{@cluster}"
        @data_dir = "/var/lib/postgresql/#{@version}/#{@cluster}"
      else
        @version = version_from_psql
        if @version.nil?
          if inspec.directory('/var/lib/pgsql/data').exist?
            warn 'Unable to determine PostgreSQL version: psql did not return
             a version number and unversioned data directories were found.'
            nil
          else
            @version = version_from_dir('/var/lib/pgsql')
          end
        end
        @data_dir = locate_data_dir_location_by_version(@version)
      end

      @service = 'postgresql'
      @service += "-#{@version}" if @version.to_f >= 9.4
      @conf_dir ||= @data_dir

      verify_dirs
      if !@version.nil? && !@conf_dir.empty?
        @conf_path = File.join @conf_dir, 'postgresql.conf'
      else
        @conf_path = nil
        return skip_resource 'Seems like PostgreSQL is not installed on your system'
      end
    end

    def to_s
      'PostgreSQL'
    end

    private

    def verify_dirs
      warn "Default postgresql configuration directory: #{@conf_dir} does not exist. " \
        "Postgresql may not be installed or we've misidentified the configuration " \
        'directory.' unless inspec.directory(@conf_dir).exist?

      warn "Default postgresql data directory: #{@data_dir} does not exist. " \
        "Postgresql may not be installed or we've misidentified the data " \
        'directory.' unless inspec.directory(@data_dir).exist?
    end

    def version_from_psql
      return unless inspec.command('psql').exist?
      inspec.command("psql --version | awk '{ print $NF }' | awk -F. '{ print $1\".\"$2 }'").stdout.strip
    end

    def locate_data_dir_location_by_version(ver = @version)
      data_dir_loc = nil
      dir_list = [
        "/var/lib/pgsql/#{ver}/data",
        '/var/lib/pgsql/data',
        '/var/lib/postgres/data',
        '/var/lib/postgresql/data',
      ]

      dir_list.each do |dir|
        data_dir_loc = dir if inspec.directory(dir).exist?
        break
      end

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
      dir.chomp.split('/').last
    end

    def cluster_from_dir(dir)
      # Main is the default cluster name on debian use it if it
      # exists.
      if inspec.directory("#{dir}/main").exist?
        'main'
      else
        dirs = inspec.command("ls -d #{dir}/*/").stdout.lines
        first = dirs.first.chomp.split('/').last
        if dirs.count > 1
          warn "Multiple postgresql clusters configured or incorrect base dir #{dir}"
          warn "Using the first directory found: #{first}"
        end
        first
      end
    end
  end
end
