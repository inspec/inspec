#!/usr/bin/env ruby
# encoding: utf-8
# Copyright 2015 Dominik Richter. All rights reserved.
# author: Dominik Richter
# author: Christoph Hartmann

require 'thor'
require 'json'
require 'pp'
require 'utils/base_cli'
require 'utils/json_log'
require 'inspec/runner_mock'

class Inspec::InspecCLI < Inspec::BaseCLI # rubocop:disable Metrics/ClassLength
  class_option :diagnose, type: :boolean,
    desc: 'Show diagnostics (versions, configurations)'

  desc 'json PATH', 'read all tests in PATH and generate a JSON summary'
  option :output, aliases: :o, type: :string,
    desc: 'Save the created profile to a path'
  option :controls, type: :array,
    desc: 'A list of controls to include. Ignore all other tests.'
  profile_options
  def json(target)
    diagnose
    o = opts.dup
    o[:ignore_supports] = true

    profile = Inspec::Profile.for_target(target, o)
    dst = o[:output].to_s
    if dst.empty?
      puts JSON.dump(profile.info)
    else
      if File.exist? dst
        puts "----> updating #{dst}"
      else
        puts "----> creating #{dst}"
      end
      fdst = File.expand_path(dst)
      File.write(fdst, JSON.dump(profile.info))
    end
  end

  desc 'check PATH', 'verify all tests at the specified PATH'
  option :format, type: :string
  profile_options
  def check(path) # rubocop:disable Metrics/AbcSize
    diagnose
    o = opts.dup
    # configure_logger(o) # we do not need a logger for check yet
    o[:ignore_supports] = true # we check for integrity only

    # run check
    profile = Inspec::Profile.for_target(path, o)
    result = profile.check

    if opts['format'] == 'json'
      puts JSON.generate(result)
    else
      %w{location profile controls timestamp valid}.each do |item|
        puts format('%-12s %s', item.to_s.capitalize + ':',
                    mark_text(result[:summary][item.to_sym]))
      end
      puts

      if result[:errors].empty? and result[:warnings].empty?
        puts 'No errors or warnings'
      else
        red    = "\033[31m"
        yellow = "\033[33m"
        rst    = "\033[0m"

        item_msg = lambda { |item|
          pos = [item[:file], item[:line], item[:column]].compact.join(':')
          pos.empty? ? item[:msg] : pos + ': ' + item[:msg]
        }
        result[:errors].each do |item|
          puts "#{red}  ✖  #{item_msg.call(item)}#{rst}"
        end
        result[:warnings].each do |item|
          puts "#{yellow}  !  #{item_msg.call(item)}#{rst}"
        end

        puts
        puts format('Summary:     %s%d errors%s, %s%d warnings%s',
                    red, result[:errors].length, rst,
                    yellow, result[:warnings].length, rst)
      end
    end
    exit 1 unless result[:summary][:valid]
  end

  desc 'archive PATH', 'archive a profile to tar.gz (default) or zip'
  profile_options
  option :output, aliases: :o, type: :string,
    desc: 'Save the archive to a path'
  option :zip, type: :boolean, default: false,
    desc: 'Generates a zip archive.'
  option :tar, type: :boolean, default: false,
    desc: 'Generates a tar.gz archive.'
  option :overwrite, type: :boolean, default: false,
    desc: 'Overwrite existing archive.'
  option :ignore_errors, type: :boolean, default: false,
    desc: 'Ignore profile warnings.'
  def archive(path)
    diagnose

    o = opts.dup
    o[:logger] = Logger.new(STDOUT)
    o[:logger].level = get_log_level(o.log_level)

    profile = Inspec::Profile.for_target(path, o)
    result = profile.check

    if result && !opts[:ignore_errors] == false
      @logger.info 'Profile check failed. Please fix the profile before generating an archive.'
      return exit 1
    end

    # generate archive
    exit 1 unless profile.archive(opts)
  end

  desc 'exec PATHS', 'run all test files at the specified PATH.'
  exec_options
  def exec(*targets)
    diagnose
    o = opts.dup

    # run tests
    run_tests(targets, o)
  end

  desc 'detect', 'detect the target OS'
  target_options
  option :format, type: :string
  def detect
    o = opts.dup
    o[:command] = 'os.params'
    res = run_command(o)
    if opts['format'] == 'json'
      puts res.to_json
    else
      headline('Operating System Details')
      %w{name family release arch}.each { |item|
        puts format('%-10s %s', item.to_s.capitalize + ':',
                    mark_text(res[item.to_sym]))
      }
    end
  end

  desc 'shell', 'open an interactive debugging shell'
  target_options
  option :command, aliases: :c
  option :format, type: :string, default: Inspec::NoSummaryFormatter, hide: true
  def shell_func
    diagnose
    o = opts.dup
    o[:logger] = Logger.new(STDOUT)
    o[:logger].level = get_log_level(o.log_level)
    if o[:command].nil?
      runner = Inspec::Runner.new(o)
      return Inspec::Shell.new(runner).start
    else
      res = run_command(o)
      jres = res.respond_to?(:to_json) ? res.to_json : JSON.dump(res)
      puts jres
    end
  rescue RuntimeError, Train::UserError => e
    $stderr.puts e.message
  end

  desc 'version', 'prints the version of this tool'
  def version
    puts Inspec::VERSION
  end

  private

  def run_command(opts)
    opts[:test_collector] = Inspec::RunnerMock.new
    runner = Inspec::Runner.new(opts)
    runner.create_context.load(opts[:command])
  end
end

# Load all plugins on startup
ctl = Inspec::PluginCtl.new
ctl.list.each { |x| ctl.load(x) }

# load CLI plugins before the Inspec CLI has been started
Inspec::Plugins::CLI.subcommands.each { |_subcommand, params|
  Inspec::InspecCLI.register(
    params[:klass],
    params[:subcommand_name],
    params[:usage],
    params[:description],
    params[:options],
  )
}
