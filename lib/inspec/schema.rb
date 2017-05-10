# encoding: utf-8
require 'json'

module Inspec
  class Schema # rubocop:disable Metrics/ClassLength
    STATISTICS = {
      'type' => 'object',
      'additionalProperties' => false,
      'properties' => {
        'duration' => { 'type' => 'number' },
      },
    }.freeze

    PLATFORM = {
      'type' => 'object',
      'additionalProperties' => false,
      'properties' => {
        'name' => { 'type' => 'string' },
        'release' => { 'type' => 'string' },
      },
    }.freeze

    # Tags are open right, with simple key-value associations and not restrictions
    TAGS = { 'type' => 'object' }.freeze

    RESULT = {
      'type' => 'object',
      'additionalProperties' => false,
      'properties' => {
        'status' => { 'type' => 'string' },
        'code_desc' => { 'type' => 'string' },
        'run_time' => { 'type' => 'number' },
        'start_time' => { 'type' => 'string' },
        'skip_message' => { 'type' => 'string', 'optional' => true },
        'resource' => { 'type' => 'string', 'optional' => true },
      },
    }.freeze

    REF = {
      'type' => 'object',
      'additionalProperties' => false,
      'properties' => {
        'ref' => { 'type' => 'string' },
        # TODO: One of these needs to be deprecated
        'uri' => { 'type' => 'string', 'optional' => true },
        'url' => { 'type' => 'string', 'optional' => true },
      },
    }.freeze
    REFS = { 'type' => 'array', 'items' => REF }.freeze

    CONTROL = {
      'type' => 'object',
      'additionalProperties' => false,
      'properties' => {
        'id' => { 'type' => 'string' },
        'title' => { 'type' => %w{string null} },
        'desc' => { 'type' => %w{string null} },
        'impact' => { 'type' => 'number' },
        'refs' => REFS,
        'tags' => TAGS,
        'code' => { 'type' => 'string' },
        'source_location' => {
          'type' => 'object',
          'properties' => {
            'ref' => { 'type' => 'string' },
            'line' => { 'type' => 'number' },
          },
        },
        'results' => { 'type' => 'array', 'items' => RESULT },
      },
    }.freeze

    SUPPORTS = {
      'type' => 'object',
      'additionalProperties' => false,
      'properties' => {
        'os-family' => { 'type' => 'string', 'optional' => true },
      },
    }.freeze

    CONTROL_GROUP = {
      'type' => 'object',
      'additionalProperties' => false,
      'properties' => {
        'id' => { 'type' => 'string' },
        'title' => { 'type' => 'string', 'optional' => true },
        'controls' => { 'type' => 'array', 'items' => { 'type' => 'string' } },
      },
    }.freeze

    PROFILE = {
      'type' => 'object',
      'additionalProperties' => false,
      'properties' => {
        'name' => { 'type' => 'string' },
        'version' => { 'type' => 'string', 'optional' => true },
        'sha256' => { 'type' => 'string', 'optional' => false },

        'title' => { 'type' => 'string', 'optional' => true },
        'maintainer' => { 'type' => 'string', 'optional' => true },
        'copyright' => { 'type' => 'string', 'optional' => true },
        'copyright_email' => { 'type' => 'string', 'optional' => true },
        'license' => { 'type' => 'string', 'optional' => true },
        'summary' => { 'type' => 'string', 'optional' => true },

        'supports' => {
          'type' => 'array',
          'items' => SUPPORTS,
          'optional' => true,
        },
        'controls' => {
          'type' => 'array',
          'items' => CONTROL,
        },
        'groups' => {
          'type' => 'array',
          'items' => CONTROL_GROUP,
        },
        'attributes' => {
          'type' => 'array',
          # TODO: more detailed specification needed
        },
      },
    }.freeze

    EXEC_JSON = {
      'type' => 'object',
      'additionalProperties' => false,
      'properties' => {
        'platform' => PLATFORM,
        'profiles' => {
          'type' => 'array',
          'items' => PROFILE,
        },
        'statistics' => STATISTICS,
        'version' => { 'type' => 'string' },

        # DEPRECATED PROPERTIES!! These will be removed with the next major version bump
        'controls' => 'array',
        'other_checks' => 'array',
      },
    }.freeze

    MIN_CONTROL = {
      'type' => 'object',
      'additionalProperties' => false,
      'properties' => {
        'id' => { 'type' => 'string' },
        'profile_id' => { 'type' => %w{string null} },
        'status' => { 'type' => 'string' },
        'code_desc' => { 'type' => 'string' },
        'skip_message' => { 'type' => 'string', 'optional' => true },
        'resource' => { 'type' => 'string', 'optional' => true },
      },
    }.freeze

    EXEC_JSONMIN = {
      'type' => 'object',
      'additionalProperties' => false,
      'properties' => {
        'statistics' => STATISTICS,
        'version' => { 'type' => 'string' },
        'controls' => {
          'type' => 'array',
          'items' => MIN_CONTROL,
        },
      },
    }.freeze

    LIST = {
      'exec-json' => EXEC_JSON,
      'exec-jsonmin' => EXEC_JSONMIN,
    }.freeze

    def self.names
      LIST.keys
    end

    def self.json(name)
      v = LIST[name] ||
          raise("Cannot find schema #{name.inspect}.")
      JSON.dump(v)
    end
  end
end
