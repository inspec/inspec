#!/usr/bin/env ruby
# frozen_string_literal: true

# Removes default gemspecs that would shadow Habitat-installed gem versions on
# macOS.  Ruby on macOS ships certain gems (e.g. erb, zlib) as "default gems"
# whose .gemspec files live inside the Ruby stdlib directory.  When Habitat
# installs newer versions of those gems the default gemspecs still cause the
# bundled version to be loaded instead of the installed one.  This script
# deletes the conflicting default gemspecs so the Habitat-installed versions
# take precedence.
require "rubygems"

DEFAULT_GEMS_TO_REMOVE = %w[erb zlib].freeze

def remove_default_gemspecs
  puts "Removing default gemspecs that shadow Habitat-installed versions..."
  DEFAULT_GEMS_TO_REMOVE.each do |gem_name|
    specs = Gem::Specification.find_all_by_name(gem_name).select(&:default_gem?)
    if specs.empty?
      puts "  No default gemspec found for #{gem_name}, skipping"
      next
    end

    specs.each do |spec|
      gemspec_path = spec.spec_file
      if File.exist?(gemspec_path)
        puts "  Removing default gemspec: #{gemspec_path}"
        File.delete(gemspec_path)
        puts "  Successfully removed default gemspec for #{gem_name}"
      else
        puts "  Default gemspec not found at #{gemspec_path}, skipping"
      end
    end
  end
rescue StandardError => e
  warn "  Warning: Failed to remove default gemspecs: #{e.message}"
end

remove_default_gemspecs
