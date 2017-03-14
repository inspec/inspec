#!/usr/bin/env ruby
require 'json'

def generate(name, schema)
  File.write(name, JSON.dump(schema))
  puts "Schema created in #{name}"
end

statistics = {
  'properties' => {
    'duration' => { 'type' => 'number' },
  },
}

tags = { 'type' => 'object' }

result = {
  'type' => 'object',
  'properties' => {
    'status' => { 'type' => 'string' },
    'code_desc' => { 'type' => 'string' },
    'run_time' => { 'type' => 'number' },
    'start_time' => { 'type' => 'string' },
  },
}

ref = {
  'type' => 'object',
  'properties' => {
    'url' => { 'type' => 'string', 'optional' => true },
    'ref' => { 'type' => 'string' },
  },
}
refs = { 'type' => 'array', 'items' => ref }

control = {
  'properties' => {
    'id' => { 'type' => 'string' },
    'title' => { 'type' => %w{string null} },
    'desc' => { 'type' => %w{string null} },
    'impact' => { 'type' => 'number' },
    'refs' => refs,
    'tags' => tags,
    'code' => { 'type' => 'string' },
    'source_location' => {
      'type' => 'object',
      'properties' => {
        'ref' => { 'type' => 'string' },
        'line' => { 'type' => 'number' },
      },
    },
    'results' => { 'type' => 'array', 'items' => result },
  },
}

supports = {
  'type' => 'object',
  'properties' => {
    'os-family' => { 'type' => 'string', 'optional' => true },
  },
}

profile = {
  'type' => 'object',
  'properties' => {
    'title' => { 'type' => 'string' },
    'maintainer' => { 'type' => 'string' },
    'copyright' => { 'type' => 'string' },
    'copyright_email' => { 'type' => 'string' },
    'license' => { 'type' => 'string' },
    'summary' => { 'type' => 'string' },
    'version' => { 'type' => 'string' },
    'supports' => {
      'type' => 'array',
      'items' => supports,
    },
    'controls' => {
      'type' => 'array',
      'items' => control,
    },
  },
}

exec_full = {
  'type' => 'object',
  'properties' => {
    'profiles' => {
      'type' => 'array',
      'items' => profile,
    },
    'statistics' => statistics,
    'version' => { 'type' => 'string' },

    # DEPRECATED PROPERTIES!! These will be removed with the next major version bump
    'controls' => 'array',
    'other_checks' => 'array',
  },
  'additionalProperties' => false,
}

generate('inspec.exec.full.json', exec_full)

min_control = {
  'type' => 'object',
  'properties' => {
    'id' => { 'type' => 'string' },
    'profile_id' => { 'type' => 'string' },
    'status' => { 'type' => 'string' },
    'code_desc' => { 'type' => 'string' },
    'skip_message' => { 'type' => 'string', 'optional' => true },
    'resource' => { 'type' => 'string', 'optional' => true },
  },
}

exec_min = {
  'type' => 'object',
  'properties' => {
    'statistics' => statistics,
    'version' => { 'type' => 'string' },
    'controls' => {
      'type' => 'array',
      'items' => min_control,
    },
  },
}

generate('inspec.exec.min.json', exec_min)
