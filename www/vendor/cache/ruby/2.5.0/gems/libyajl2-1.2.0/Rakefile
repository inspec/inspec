$: << File.expand_path(File.join(File.dirname( __FILE__ ), "lib"))

require 'rubygems'
require 'rake'

require 'rubygems/package_task'
require 'rspec/core/rake_task'
require 'rake/extensiontask'

GEM_NAME = "libyajl2"

gemspec = eval(File.read('libyajl2.gemspec'))

Gem::PackageTask.new(gemspec) do |pkg|
  pkg.need_tar = true
end

#
# build tasks
#

#desc "repackage and install #{GEM_NAME}-#{Libyajl2::VERSION}.gem"
#task :install => :repackage do
#  sh %{gem install pkg/#{GEM_NAME}-#{Libyajl2::VERSION}.gem --no-rdoc --no-ri}
#end
#
#desc "uninstall #{GEM_NAME}-#{Libyajl2::VERSION}.gem"
#task :uninstall do
#  sh %{gem uninstall #{GEM_NAME} -x -v #{Libyajl2::VERSION} }
#end
#
#task :compile do
#  cp "ext/libyajl2"
#  ruby "extconf.rb"
#end

desc "clean the git repo"
task :clean do
  sh "git clean -fdx"
  cd "ext/libyajl2/vendor/yajl"
  sh "git clean -fdx"
end

Rake::ExtensionTask.new('libyajl', gemspec) do |ext|
  ext.lib_dir = 'lib/libyajl2/vendored-libyajl2/lib'
  ext.ext_dir = 'ext/libyajl2'
end

# hack to generate yajl_version.h without using cmake
def generate_yajl_version
  build_path = File.expand_path("../ext/libyajl2", __FILE__)
  vendor_path = File.expand_path("../ext/libyajl2/vendor/yajl", __FILE__)

  yajl_major = yajl_minor = yajl_micro = nil
  File.open("#{vendor_path}/CMakeLists.txt").each do |line|
    if m = line.match(/YAJL_MAJOR (\d+)/)
      yajl_major = m[1]
    end
    if m = line.match(/YAJL_MINOR (\d+)/)
      yajl_minor = m[1]
    end
    if m = line.match(/YAJL_MICRO (\d+)/)
      yajl_micro = m[1]
    end
  end
  File.open("#{build_path}/api/yajl_version.h", "w+") do |out|  # FIXME: relative path
    File.open("#{vendor_path}/src/api/yajl_version.h.cmake").each do |line|
      line.gsub!(/\$\{YAJL_MAJOR\}/, yajl_major)
      line.gsub!(/\$\{YAJL_MINOR\}/, yajl_minor)
      line.gsub!(/\$\{YAJL_MICRO\}/, yajl_micro)
      out.write(line)
    end
  end
  FileUtils.cp "#{build_path}/api/yajl_version.h", "#{build_path}/yajl/yajl_version.h"
end

desc "Prep and patch yajl sources"
task :prep do
  build_path = File.expand_path("../ext/libyajl2", __FILE__)
  vendor_src_path = File.expand_path("../ext/libyajl2/vendor/yajl/src", __FILE__)

  # copy yajl files into build position
  FileUtils.cp Dir["#{vendor_src_path}/*.c"], build_path
  FileUtils.cp Dir["#{vendor_src_path}/*.h"], build_path

  # the *.c files need api/yajl_foo.h headers
  Dir.mkdir "#{build_path}/api" unless File.exist?("#{build_path}/api")
  FileUtils.cp Dir["#{vendor_src_path}/api/*.h"], "#{build_path}/api"

  # the header files need yajl/yajl_foo.h headers (and windows symlinks
  # are a bit of a PITA so just copy them all)
  Dir.mkdir "#{build_path}/yajl" unless File.exist?("#{build_path}/yajl")
  FileUtils.cp Dir["#{vendor_src_path}/api/*.h"], "#{build_path}/yajl"

  # apply patches that haven't yet been pushed upstream
  Dir["#{build_path}/patches/*"].sort.each do |file|
    Dir.chdir build_path
    sh "patch -p2 --binary < #{file}"
  end

  # generate the yajl_version.h header file without invoking cmake
  generate_yajl_version
end

desc "Deploy headers (for after compile)"
task :headers do
  include_path = File.expand_path("../lib/libyajl2/vendored-libyajl2/include/yajl", __FILE__)
  build_path = File.expand_path("../ext/libyajl2", __FILE__)

  FileUtils.mkdir_p(include_path)
  FileUtils.cp Dir["#{build_path}/api/*.h"], include_path
end

#
# FIXME: need a rake task to update the git submodule and need to do that before shipping
#
# to ship, update lib/libyajl2/version.rb and commit that, then:
#
#  git push && rake clean && rake prep && rake gem && rake ship
#
desc "Ship it"
task :ship do
  sh("git tag #{Libyajl2::VERSION}")
  sh("git push --tags")
  Dir[File.expand_path("../pkg/*.gem", __FILE__)].reverse.each do |built_gem|
    sh("gem push #{built_gem}")
  end
end

#
# test tasks
#

RSpec::Core::RakeTask.new(:spec)

if RUBY_VERSION.to_f >= 1.9
  namespace :integration do
    begin
      require 'kitchen'
    rescue LoadError
      task :vagrant do
        puts "test-kitchen gem is not installed"
      end
      task :cloud do
        puts "test-kitchen gem is not installed"
      end
    else
      desc 'Run Test Kitchen with Vagrant'
      task :vagrant do
        Kitchen.logger = Kitchen.default_file_logger
        Kitchen::Config.new.instances.each do |instance|
          instance.test(:always)
        end
      end

      desc 'Run Test Kitchen with cloud plugins'
      task :cloud do
        if ENV['TRAVIS_PULL_REQUEST'] != 'true'
          ENV['KITCHEN_YAML'] = '.kitchen.cloud.yml'
          sh "kitchen test --concurrency 4"
        end
      end
    end
  end
  namespace :style do
    desc 'Run Ruby style checks'
    begin
      require 'rubocop/rake_task'
    rescue LoadError
      task :rubocop do
        puts "rubocop gem is not installed"
      end
    else
      Rubocop::RakeTask.new(:rubocop) do |t|
        t.fail_on_error = false
      end
    end

    desc 'Run Ruby smell checks'
    begin
      require 'reek/rake/task'
    rescue LoadError
      task :reek do
        puts "reek gem is not installed"
      end
    else
      Reek::Rake::Task.new(:reek) do |t|
        t.fail_on_error = false
        t.config_files = '.reek.yml'
      end
    end
  end
else
  namespace :integration do
    task :vagrant do
      puts "test-kitchen unsupported on ruby 1.8"
    end
    task :cloud do
      puts "test-kitchen unsupported on ruby 1.8"
    end
  end
  namespace :style do
    task :rubocop do
      puts "rubocop unsupported on ruby 1.8"
    end
    task :reek do
      puts "reek unsupported on ruby 1.8"
    end
  end
end


desc 'Run all style checks'
task :style => ['style:rubocop', 'style:reek']

desc 'Run style + spec tests by default on travis'
task :travis => ['spec', 'style']

desc 'Run style, spec and test kichen on travis'
task :travis_all => ['spec', 'integration:cloud', 'style']

task :default => ['spec', 'integration:vagrant', 'style']
