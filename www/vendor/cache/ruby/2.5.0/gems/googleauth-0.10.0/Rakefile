# -*- ruby -*-
require "json"
require "bundler/gem_tasks"

task :ci do
  header "Using Ruby - #{RUBY_VERSION}"
  sh "bundle exec rubocop"
  sh "bundle exec rspec"
end

task :release_gem, :tag do |_t, args|
  tag = args[:tag]
  raise "You must provide a tag to release." if tag.nil?

  # Verify the tag format "vVERSION"
  m = tag.match(/google-auth-library-ruby\/v(?<version>\S*)/)
  raise "Tag #{tag} does not match the expected format." if m.nil?

  version = m[:version]
  raise "You must provide a version." if version.nil?

  api_token = ENV["RUBYGEMS_API_TOKEN"]

  require "gems"
  if api_token
    ::Gems.configure do |config|
      config.key = api_token
    end
  end

  Bundler.with_clean_env do
    sh "rm -rf pkg"
    sh "bundle update"
    sh "bundle exec rake build"
  end

  path_to_be_pushed = "pkg/googleauth-#{version}.gem"
  if File.file? path_to_be_pushed
    begin
      ::Gems.push File.new(path_to_be_pushed)
      puts "Successfully built and pushed googleauth for version #{version}"
    rescue StandardError => e
      puts "Error while releasing googleauth version #{version}: #{e.message}"
    end
  else
    raise "Cannot build googleauth for version #{version}"
  end
end

namespace :kokoro do
  task :load_env_vars do
    service_account = "#{ENV['KOKORO_GFILE_DIR']}/service-account.json"
    ENV["GOOGLE_APPLICATION_CREDENTIALS"] = service_account
    filename = "#{ENV['KOKORO_GFILE_DIR']}/env_vars.json"
    env_vars = JSON.parse File.read(filename)
    env_vars.each { |k, v| ENV[k] = v }
  end

  task :presubmit do
    Rake::Task["ci"].invoke
  end

  task :continuous do
    Rake::Task["ci"].invoke
  end

  task :nightly do
    Rake::Task["ci"].invoke
  end

  task :release do
    version = "0.1.0"
    Bundler.with_clean_env do
      version = `bundle exec gem list`
                .split("\n").select { |line| line.include? "googleauth" }
                .first.split("(").last.split(")").first || "0.1.0"
    end
    Rake::Task["kokoro:load_env_vars"].invoke
    Rake::Task["release_gem"].invoke "google-auth-library-ruby/v#{version}"
  end
end

def header str, token = "#"
  line_length = str.length + 8
  puts ""
  puts token * line_length
  puts "#{token * 3} #{str} #{token * 3}"
  puts token * line_length
  puts ""
end
