require "rubygems"

require "bundler/setup"
Bundler::GemHelper.install_tasks

require "standard/rake"

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new
task default: [:spec, "standard:fix"]

task :clobber_package do
  begin
    rm_r "pkg"
  rescue
    nil
  end
end

desc "Delete all generated files"
task clobber: [:clobber_package]

desc "Test all Gemfiles from spec/*.gemfile"
task :test_all do
  require "pty"
  require "shellwords"
  cmd      = "bundle update && bundle exec rake --trace"
  statuses = Dir.glob("./sprockets*.gemfile").map { |gemfile|
    Bundler.with_clean_env do
      env = {"BUNDLE_GEMFILE" => gemfile}
      warn "Testing #{File.basename(gemfile)}:"
      warn "  export BUNDLE_GEMFILE=#{gemfile}"
      warn "  #{cmd}"
      PTY.spawn(env, cmd) do |r, _w, pid|
        begin
          r.each_line { |l| puts l }
        rescue Errno::EIO
          # Errno:EIO error means that the process has finished giving output.
        ensure
          ::Process.wait pid
        end
      end
      [$? && $?.exitstatus == 0, gemfile]
    end
  }
  failed = statuses.reject(&:first).map(&:last)
  if failed.empty?
    warn "✓ Tests pass with all #{statuses.size} gemfiles"
  else
    warn "❌ FAILING #{failed * "\n"}"
    exit 1
  end
end
