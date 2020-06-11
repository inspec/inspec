require "bundler/gem_tasks"
require "json"

task :release_gem, :tag do |_t, args|
  tag = args[:tag]
  raise "You must provide a tag to release." if tag.nil?

  # Verify the tag format "vVERSION"
  m = tag.match(/v(?<version>\S*)/)
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

  path_to_be_pushed = "pkg/google-api-client-#{version}.gem"
  gem_was_published = nil
  if File.file? path_to_be_pushed
    begin
      response = ::Gems.push File.new(path_to_be_pushed)
      puts response
      raise unless response.include? "Successfully registered gem:"
      gem_was_published = true
      puts "Successfully built and pushed google-api-client for version #{version}"
    rescue StandardError => e
      gem_was_published = false
      puts "Error while releasing google-api-client version #{version}: #{e.message}"
    end
  else
    raise "Cannot build google-api-client for version #{version}"
  end

  Rake::Task["kokoro:publish_docs"].invoke if gem_was_published
end

task default: :spec

namespace :kokoro do
  task :load_env_vars do
    service_account = "#{ENV['KOKORO_GFILE_DIR']}/service-account.json"
    ENV["GOOGLE_APPLICATION_CREDENTIALS"] = service_account
    filename = "#{ENV['KOKORO_GFILE_DIR']}/env_vars.json"
    env_vars = JSON.parse File.read(filename)
    env_vars.each { |k, v| ENV[k] = v }
  end

  task :presubmit do
    Rake::Task["spec"].invoke
  end

  task :continuous do
    Rake::Task["spec"].invoke
  end

  task :nightly do
    Rake::Task["spec"].invoke
  end

  task :post do
    require_relative "rakelib/link_checker.rb"

    link_checker = LinkChecker.new
    link_checker.run
    exit link_checker.exit_status
  end

  task :release do
    # Until code generation process is updated and release-please is set up, just publish docs
    require_relative "rakelib/devsite/devsite_builder.rb"

    DevsiteBuilder.new.publish_if_missing ENV["DOCS_BUILD_TAG"]
  end

  desc "Publish docs for the latest git tag"
  task :publish_docs do
    require_relative "rakelib/devsite/devsite_builder.rb"

    DevsiteBuilder.new.publish ENV["DOCS_BUILD_TAG"]
  end
end

def header str, token = "#"
  line_length = str.length + 8
  puts
  puts token * line_length
  puts "#{token * 3} #{str} #{token * 3}"
  puts token * line_length
  puts
end
