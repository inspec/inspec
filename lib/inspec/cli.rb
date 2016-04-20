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
      headline('Summary')
      %w{location profile controls timestamp valid}.each { |item|
        puts "#{mark_text(item.to_s.capitalize + ':')} #{result[:summary][item.to_sym]}"
      }
      puts

      %w{errors warnings}.each { |list|
        headline(list.to_s.capitalize)
        result[list.to_sym].each { |item|
          puts "#{item[:file]}:#{item[:line]}:#{item[:column]}: #{item[:msg]} "
        }
        puts
      }
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
    run_tests(targets, opts)
  end

  desc 'detect', 'detect the target OS'
  target_options
  def detect
    diagnose

    rel = File.join(File.dirname(__FILE__), *%w{.. utils detect.rb})
    detect_util = File.expand_path(rel)
    # exits on execution:
    runner = Inspec::Runner.new(opts)
    profile = Inspec::Profile.for_target(detect_util, opts)
    runner.add_profile(profile)
    exit runner.run
  rescue RuntimeError => e
    puts e.message
  end

  desc 'shell', 'open an interactive debugging shell'
  target_options
  option :format, type: :string, default: Inspec::NoSummaryFormatter, hide: true
  def shell_func
    diagnose
    o = opts.dup
    o[:logger] = Logger.new(STDOUT)
    o[:logger].level = get_log_level(o.log_level)

    runner = Inspec::Runner.new(o)
    Inspec::Shell.new(runner).start
  rescue RuntimeError => e
    puts e.message
  end

  desc 'version', 'prints the version of this tool'
  def version
    puts Inspec::VERSION
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
