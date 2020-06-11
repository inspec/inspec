require "bundler/gem_tasks"

desc "Open a Pry Console"
task :console do
  require "pry"
  require "pathname"
  $: << (Pathname(__FILE__).dirname + "lib").to_s
  require "gssapi"
  ARGV.clear
  Pry.start
end
