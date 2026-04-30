#!/usr/bin/env ruby
# Removes default gemspecs bundled with Ruby so that the upgraded
# gem versions installed during the Habitat build are loaded instead.
require "rbconfig"

GEMS_TO_REMOVE = %w{erb zlib}.freeze

def remove_default_gemspecs
  default_gemspec_dir = File.join(
    RbConfig::CONFIG["rubylibprefix"],
    "gems",
    RbConfig::CONFIG["ruby_version"],
    "specifications",
    "default"
  )

  unless File.directory?(default_gemspec_dir)
    puts "  Default gemspec directory not found: #{default_gemspec_dir}"
    return
  end

  GEMS_TO_REMOVE.each do |gem_name|
    gemspecs = Dir.glob(File.join(default_gemspec_dir, "#{gem_name}-*.gemspec"))
    if gemspecs.empty?
      puts "  No default gemspec found for #{gem_name}"
      next
    end

    gemspecs.each do |gemspec|
      puts "  Removing default gemspec: #{gemspec}"
      File.delete(gemspec)
      puts "  Successfully removed #{File.basename(gemspec)}"
    end
  end
rescue StandardError => e
  warn "  Warning: Failed to remove default gemspecs: #{e.message}"
end

remove_default_gemspecs
