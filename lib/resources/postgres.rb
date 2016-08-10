# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Dominik Richter
# author: Christoph Hartmann
# license: All rights reserved

module Inspec::Resources
  class Postgres < Inspec.resource(1)
    name 'postgres'

    attr_reader :service, :data_dir, :conf_dir, :conf_path
    def initialize
      os = inspec.os
      if os.debian?
        #
        # https://wiki.debian.org/PostgreSql
        #
        # Debian allows multiple versions of postgresql to be
        # installed as well as multiple "clusters" to be configured.
        #
        version = version_from_dir('/etc/postgresql')
        cluster = cluster_from_dir("/etc/postgresql/#{version}")
        @conf_dir = "/etc/postgresql/#{version}/#{cluster}"
        @data_dir = "/var/lib/postgresql/#{version}/#{cluster}"
      elsif os.redhat?
        #
        # /var/lib/pgsql/data is the default data directory on RHEL6
        # and RHEL7. However, PR #824 explicitly added version-based
        # directories. Thus, we call #version_from_dir unless it looks
        # like we are using unversioned directories.
        #
        # TODO(ssd): This has the potential to be noisy because of the
        # warning in version_from_dir. We should determine which case
        # is more common and only warn in the less common case.
        #
        version = if inspec.directory('/var/lib/pgsql/data').exist?
                    warn 'Found /var/lib/pgsql/data. Assuming postgresql install uses un-versioned directories.'
                    nil
                  else
                    version_from_dir('/var/lib/pgsql/')
                  end

        @data_dir = File.join('/var/lib/pgsql/', version.to_s, 'data')
      elsif os[:name] == 'arch'
        #
        # https://wiki.archlinux.org/index.php/PostgreSQL
        #
        # The archlinux wiki points to /var/lib/postgresql/data as the
        # main data directory.
        #
        @data_dir = '/var/lib/postgres/data'
      else
        #
        # According to https://www.postgresql.org/docs/9.5/static/creating-cluster.html
        #
        # > There is no default, although locations such as
        # > /usr/local/pgsql/data or /var/lib/pgsql/data are popular.
        #
        @data_dir = '/var/lib/pgsql/data'
      end

      @service = 'postgresql'
      @conf_dir ||= @data_dir
      verify_dirs
      @conf_path = File.join @conf_dir, 'postgresql.conf'
    end

    def to_s
      'PostgreSQL'
    end

    private

    def verify_dirs
      if !inspec.directory(@conf_dir).exist?
        warn "Default postgresql configuration directory: #{@conf_dir} does not exist. Postgresql may not be installed or we've misidentified the configuration directory."
      end

      if !inspec.directory(@data_dir).exist?
        warn "Default postgresql data directory: #{@data_dir} does not exist. Postgresql may not be installed or we've misidentified the data directory."
      end
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
