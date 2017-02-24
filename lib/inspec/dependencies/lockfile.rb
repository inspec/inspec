# encoding: utf-8
require 'yaml'

module Inspec
  class Lockfile
    # When we finalize this feature, we should set these to 1
    MINIMUM_SUPPORTED_VERSION = 1
    CURRENT_LOCKFILE_VERSION = 1

    def self.from_dependency_set(dep_set)
      lockfile_content = {
        'lockfile_version' => CURRENT_LOCKFILE_VERSION,
        'depends' => dep_set.to_array,
      }
      new(lockfile_content)
    end

    def self.from_content(content)
      parsed_content = YAML.load(content)
      version = parsed_content['lockfile_version']
      raise "No lockfile_version set in #{path}!" if version.nil?
      validate_lockfile_version!(version.to_i)
      new(parsed_content)
    end

    def self.from_file(path)
      content = File.read(path)
      from_content(content)
    end

    # rubocop:disable Style/GuardClause
    def self.validate_lockfile_version!(version)
      if version < MINIMUM_SUPPORTED_VERSION
        raise <<EOF
This lockfile specifies a lockfile_version of #{version} which is
lower than the minimum supported version #{MINIMUM_SUPPORTED_VERSION}.

Please create a new lockfile for this project by running:

    inspec vendor
EOF
      elsif version > CURRENT_LOCKFILE_VERSION
        raise <<EOF
This lockfile claims to be version #{version} which is greater than
the most recent lockfile version(#{CURRENT_LOCKFILE_VERSION}).

This may happen if you are using an older version of inspec than was
used to create the lockfile.
EOF
      end
    end
    # rubocop:enable Style/GuardClause

    attr_reader :version, :deps
    def initialize(lockfile_content_hash)
      version = lockfile_content_hash['lockfile_version']
      @version = version.to_i
      parse_content_hash(lockfile_content_hash)
    end

    def to_yaml
      {
        'lockfile_version' => CURRENT_LOCKFILE_VERSION,
        'depends' => @deps.map { |i| stringify_keys(i) },
      }.to_yaml
    end

    private

    # Refactor this to be "version-wise" - i.e. make one dispatch
    # function for each version so that even if it duplicates code,
    # it can describe the part of the code that it expects to be
    # different. Then that dispatch routine can call more well
    # defined methods like "parse_v0_dependencies" or
    # "parse_flat_dependencies" or what not as things generally
    # develop. It does help people easily set breakpoints/track
    # different entry points of the API.
    def parse_content_hash(lockfile_content_hash)
      case version
      when 1
        parse_content_hash_1(lockfile_content_hash)
      else
        # If we've gotten here, there is likely a mistake in the
        # lockfile version validation in the constructor.
        raise "No lockfile parser for version #{version}"
      end
    end

    def parse_content_hash_1(lockfile_content_hash)
      @deps = if lockfile_content_hash['depends']
                lockfile_content_hash['depends'].map { |i| symbolize_keys(i) }
              end
    end

    def mutate_hash_keys_with(hash, fun)
      hash.each_with_object({}) do |v, memo|
        key = fun.call(v[0])
        value = if v[1].is_a?(Hash)
                  mutate_hash_keys_with(v[1], fun)
                elsif v[1].is_a?(Array)
                  v[1].map do |i|
                    i.is_a?(Hash) ? mutate_hash_keys_with(i, fun) : i
                  end
                else
                  v[1]
                end
        memo[key] = value
      end
    end

    def stringify_keys(hash)
      mutate_hash_keys_with(hash, proc { |i| i.to_s })
    end

    def symbolize_keys(hash)
      mutate_hash_keys_with(hash, proc { |i| i.to_sym })
    end
  end
end
