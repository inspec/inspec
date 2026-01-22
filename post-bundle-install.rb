#!/usr/bin/env ruby

gem_home = Gem.paths.home

puts "fixing bundle installed gems in #{gem_home}"

# Handle default gem conflicts by removing the default gemspec and installing a newer version
def handle_gem_conflict(gem_name, old_version, new_version)
  puts "Checking #{gem_name} gem installation..."
  gem_info = `gem info #{gem_name}`

  return unless gem_info.include?("Installed at (default):") && gem_info.include?("#{gem_name} (#{old_version})")

  # Extract the default gem path
  default_path = gem_info.match(/Installed at \(default\): (.+)$/)[1]

  if default_path
    gemspec_path = File.join(default_path.strip, "specifications", "default", "#{gem_name}-#{old_version}.gemspec")

    if File.exist?(gemspec_path)
      puts "Removing default #{gem_name} gemspec: #{gemspec_path}"
      File.delete(gemspec_path)
    end
  end

  puts "Installing #{gem_name} gem..."
  system("gem install #{gem_name} -v #{new_version}") or raise "gem install #{gem_name} failed"
  puts "#{gem_name} gem installed successfully"
end

# Handle gem conflicts
handle_gem_conflict("resolv", "0.2.1", "0.2.3")
handle_gem_conflict("uri", "0.12.4", "0.12.5")

