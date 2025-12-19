#!/usr/bin/env ruby

gem_home = Gem.paths.home

puts "fixing bundle installed gems in #{gem_home}"

# Handle resolv gem conflict with default ruby gem
puts "Checking resolv gem installation..."
resolv_info = `gem info resolv`

if resolv_info.include?("Installed at (default):") && resolv_info.include?("resolv (0.2.1)")
  # Extract the default gem path
  default_path = resolv_info.match(/Installed at \(default\): (.+)$/)[1]

  if default_path
    gemspec_path = File.join(default_path.strip, "specifications", "default", "resolv-0.2.1.gemspec")

    if File.exist?(gemspec_path)
      puts "Removing default resolv gemspec: #{gemspec_path}"
      File.delete(gemspec_path)
    end
  end

  puts "Installing resolv gem..."
  system("gem install resolv -v 0.2.3") or raise "gem install resolv failed"
  puts "resolv gem installed successfully"
end