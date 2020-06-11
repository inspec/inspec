#
# Author:: Adam Jacob (<adam@chef.io>)
# Author:: Christopher Brown (<cb@chef.io>)
# Copyright:: Copyright (c) 2008-2016 Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "logger"
require_relative "log/version"
require_relative "log/formatter"
require_relative "log/child"
require_relative "log/logging"
require_relative "log/logger"

module Mixlib
  module Log

    include Logging

    def reset!
      @logger  ||= nil
      @loggers ||= []
      close!
      @logger = @loggers = nil
      @metadata = {}
    end

    # An Array of log devices that will be logged to. Defaults to just the default
    # \@logger log device, but you can push to this array to add more devices.
    def loggers
      @loggers ||= [logger]
    end

    ##
    # init always returns a configured logger
    # and creates a new one if it doesn't yet exist
    ##
    def logger
      @logger ||= init
    end

    # Sets the log device to +new_log_device+. Any additional loggers
    # that had been added to the +loggers+ array will be cleared.
    def logger=(new_log_device)
      reset!
      @logger = new_log_device
    end

    def use_log_devices(other)
      if other.respond_to?(:loggers) && other.respond_to?(:logger)
        @loggers = other.loggers
        @logger = other.logger
      elsif other.is_a?(Array)
        @loggers = other
        @logger = other.first
      else
        msg = "#use_log_devices takes a Mixlib::Log object or array of log devices. " <<
          "You gave: #{other.inspect}"
        raise ArgumentError, msg
      end
      @configured = true
    end

    # Use Mixlib::Log.init when you want to set up the logger manually.  Arguments to this method
    # get passed directly to Logger.new, so check out the documentation for the standard Logger class
    # to understand what to do here.
    #
    # If this method is called with no arguments, it will log to STDOUT at the :warn level.
    #
    # It also configures the Logger instance it creates to use the custom Mixlib::Log::Formatter class.
    def init(*opts)
      reset!
      @logger = logger_for(*opts)
      @logger.formatter = Mixlib::Log::Formatter.new if @logger.respond_to?(:formatter=)
      @logger.level = Logger::WARN
      @configured = true
      @parent = nil
      @metadata = {}
      @logger
    end

    # Let the application query if logging objects have been set up
    def configured?
      @configured
    end

    attr_accessor :metadata

    # Sets the level for the Logger object by symbol.  Valid arguments are:
    #
    #  :trace
    #  :debug
    #  :info
    #  :warn
    #  :error
    #  :fatal
    #
    # Throws an ArgumentError if you feed it a bogus log level.
    def level=(new_level)
      level_int = LEVEL_NAMES.key?(new_level) ? new_level : LEVELS[new_level]
      raise ArgumentError, "Log level must be one of :trace, :debug, :info, :warn, :error, or :fatal" if level_int.nil?

      loggers.each { |l| l.level = level_int }
    end

    def level(new_level = nil)
      if new_level.nil?
        LEVEL_NAMES[logger.level]
      else
        self.level = (new_level)
      end
    end

    # Define the methods to interrogate the logger for the current log level.
    # Note that we *only* query the default logger (@logger) and not any other
    # loggers that may have been added, even though it is possible to configure
    # two (or more) loggers at different log levels.
    %i{trace? debug? info? warn? error? fatal?}.each do |method_name|
      define_method(method_name) do
        logger.send(method_name)
      end
    end

    def <<(msg)
      loggers.each { |l| l << msg }
    end

    def add(severity, message = nil, progname = nil, data: {}, &block)
      message, progname, data = yield if block_given?
      data = metadata.merge(data) if metadata.is_a?(Hash) && data.is_a?(Hash)
      loggers.each do |l|
        # if we don't have any metadata, let's not do the potentially expensive
        # merging and managing that this call requires
        if l.respond_to?(:add_data) && !data.nil? && !data.empty?
          l.add_data(severity, message, progname, data: data)
        else
          l.add(severity, message, progname)
        end
      end
    end

    alias :log :add

    def with_child(metadata = {})
      child = Child.new(self, metadata)
      if block_given?
        yield child
      else
        child
      end
    end

    # Passes any other method calls on directly to the underlying Logger object created with init. If
    # this method gets hit before a call to Mixlib::Logger.init has been made, it will call
    # Mixlib::Logger.init() with no arguments.
    def method_missing(method_symbol, *args, &block)
      loggers.each { |l| l.send(method_symbol, *args, &block) }
    end

    private

    def logger_for(*opts)
      if opts.empty?
        Mixlib::Log::Logger.new($stdout)
      elsif LEVELS.keys.inject(true) { |quacks, level| quacks && opts.first.respond_to?(level) }
        opts.first
      else
        Mixlib::Log::Logger.new(*opts)
      end
    end

    def all_loggers
      [@logger, *@loggers].uniq
    end

    # select all loggers with File log devices
    def loggers_to_close
      loggers_to_close = []
      all_loggers.each do |logger|
        # unfortunately Logger does not provide access to the logdev
        # via public API. In order to reduce amount of impact and
        # handle only File type log devices I had to use this method
        # to get access to it.
        next unless logger.instance_variable_defined?(:"@logdev")
        next unless (logdev = logger.instance_variable_get(:"@logdev"))

        loggers_to_close << logger if logdev.filename
      end
      loggers_to_close
    end

    def close!
      # try to close all file loggers
      loggers_to_close.each do |l|
        l.close rescue nil
      end
    end

  end
end
