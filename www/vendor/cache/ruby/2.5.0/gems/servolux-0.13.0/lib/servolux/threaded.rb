
# == Synopsis
# The Threaded module is used to perform some activity at a specified
# interval.
#
# == Details
# Sometimes it is useful for an object to have its own thread of execution
# to perform a task at a recurring interval. The Threaded module
# encapsulates this functionality so you don't have to write it yourself. It
# can be used with any object that responds to the +run+ method.
#
# The threaded object is run by calling the +start+ method. This will create
# a new thread that will invoke the +run+ method at the desired interval.
# Just before the thread is created the +before_starting+ method will be
# called (if it is defined by the threaded object). Likewise, after the
# thread is created the +after_starting+ method will be called (if it is
# defined by the threaded object).
#
# The threaded object is stopped by calling the +stop+ method. This sets an
# internal flag and then wakes up the thread. The thread gracefully exits
# after checking the flag. Like the start method, before and after methods
# are defined for stopping as well. Just before the thread is stopped the
# +before_stopping+ method will be called (if it is defined by the threaded
# object). Likewise, after the thread has died the +after_stopping+ method
# will be called (if it is defined by the threaded object).
#
# Calling the +join+ method on a threaded object will cause the calling
# thread to wait until the threaded object has stopped. An optional timeout
# parameter can be given.
#
# == Examples
# Take a look at the Servolux::Server class for an example of a threaded
# object.
#
module Servolux::Threaded

  # This method will be called by the activity thread at the desired
  # interval. Implementing classes are expect to provide this
  # functionality.
  #
  def run
    raise NotImplementedError,
         'The run method must be defined by the threaded object.'
  end

  # Start the activity thread. If already started this method will return
  # without taking any action.
  #
  # If the including class defines a 'before_starting' method, it will be
  # called before the thread is created and run. Likewise, if the
  # including class defines an 'after_starting' method, it will be called
  # after the thread is created.
  #
  def start
    return self if _activity_thread.running?
    logger.debug "Starting"

    before_starting if self.respond_to?(:before_starting)
    @_activity_thread.start self
    after_starting if self.respond_to?(:after_starting)
    self
  end

  # Stop the activity thread. If already stopped this method will return
  # without taking any action.
  #
  # If the including class defines a 'before_stopping' method, it will be
  # called before the thread is stopped. Likewise, if the including class
  # defines an 'after_stopping' method, it will be called after the thread
  # has stopped.
  #
  def stop
    return self unless _activity_thread.running?
    logger.debug "Stopping"

    before_stopping if self.respond_to?(:before_stopping)
    @_activity_thread.stop
    self
  end

  # Wait on the activity thread.  If the thread is already stopped, this
  # method will return without taking any action.  Otherwise, this method
  # does not return until the activity thread has stopped, or a specific
  # number of iterations has passed since this method was called.
  #
  def wait( limit = nil )
    return self unless _activity_thread.running?
    initial_iterations = @_activity_thread.iterations
    loop {
      break unless @_activity_thread.running?
      break if limit and @_activity_thread.iterations > ( initial_iterations + limit )
      Thread.pass
    }
  end

  # If the activity thread is running, the calling thread will suspend
  # execution and run the activity thread. This method does not return until
  # the activity thread is stopped or until _limit_ seconds have passed.
  #
  # If the activity thread is not running, this method returns immediately
  # with +nil+.
  #
  def join( limit = nil )
    _activity_thread.join(limit) ? self : nil
  end

  # Returns +true+ if the activity thread is running. Returns +false+
  # otherwise.
  #
  def running?
    _activity_thread.running?
  end

  # Returns +true+ if the activity thread has finished its maximum
  # number of iterations or the thread is no longer running.
  # Returns +false+ otherwise.
  #
  def finished_iterations?
    return true unless _activity_thread.running?
    @_activity_thread.finished_iterations?
  end

  # Returns the status of threaded object.
  #
  #    'sleep'    : sleeping or waiting on I/O
  #    'run'      : executing
  #    'aborting' : aborting
  #    false      : not running or terminated normally
  #    nil        : terminated with an exception
  #
  # If this method returns +nil+, then calling join on the threaded object
  # will cause the exception to be raised in the calling thread.
  #
  def status
    return false if _activity_thread.thread.nil?
    @_activity_thread.thread.status
  end

  # Sets the number of seconds to sleep between invocations of the
  # threaded object's 'run' method.
  #
  def interval=( value )
    value = Float(value)
    raise ArgumentError, "Sleep interval must be >= 0" unless value >= 0
    _activity_thread.interval = value
  end

  # Returns the number of seconds to sleep between invocations of the
  # threaded object's 'run' method.
  #
  def interval
    _activity_thread.interval
  end

  # Signals the activity thread to treat the sleep interval with strict
  # semantics. The time it takes for the 'run' method to execute will be
  # subtracted from the sleep interval.
  #
  # If the sleep interval is 60 seconds and the 'run' method takes 2.2 seconds
  # to execute, then the activity thread will sleep for 57.2 seconds. The
  # subsequent invocation of the 'run' will occur as close as possible to 60
  # seconds after the previous invocation.
  #
  def use_strict_interval=( value )
    _activity_thread.use_strict_interval = (value ? true : false)
  end

  # When true, the activity thread will treat the sleep interval with strict
  # semantics. See the setter method for an in depth explanation.
  #
  def use_strict_interval
    _activity_thread.use_strict_interval
  end
  alias :use_strict_interval? :use_strict_interval

  # Sets the maximum number of invocations of the threaded object's
  # 'run' method
  #
  def maximum_iterations=( value )
    unless value.nil?
      value = Integer(value)
      raise ArgumentError, "maximum iterations must be >= 1" unless value >= 1
    end

    _activity_thread.maximum_iterations = value
  end

  # Returns the maximum number of invocations of the threaded
  # object's 'run' method
  #
  def maximum_iterations
    _activity_thread.maximum_iterations
  end

  # Returns the number of iterations of the threaded object's 'run' method
  # completed thus far.
  #
  def iterations
    _activity_thread.iterations
  end

  # Set to +true+ to continue running the threaded object even if an error
  # is raised by the +run+ method. The default behavior is to stop the
  # activity thread when an error is raised by the run method.
  #
  # A SystemExit will never be caught; it will always cause the Ruby
  # interpreter to exit.
  #
  def continue_on_error=( value )
    _activity_thread.continue_on_error = (value ? true : false)
  end

  # Returns +true+ if the threaded object should continue running even if an
  # error is raised by the run method. The default is to return +false+. The
  # threaded object will stop running when an error is raised.
  #
  def continue_on_error?
    _activity_thread.continue_on_error
  end

  # :stopdoc:
  def _activity_thread
    @_activity_thread ||= ::Servolux::Threaded::ThreadContainer.new(60, false, 0, nil, false);
  end  # @private

  # @private
  ThreadContainer = Struct.new( :interval, :use_strict_interval, :iterations, :maximum_iterations, :continue_on_error, :thread, :running ) {
    def start( threaded )
      self.running = true
      self.iterations = 0
      self.thread = Thread.new { run threaded }
      Thread.pass
    end  # @private

    def stop
      self.running = false
      thread.wakeup if thread.alive?
    end  # @private

    def run( threaded )
      loop do
        begin
          mark_time
          break unless running?
          threaded.run

          if maximum_iterations
            self.iterations += 1
            if finished_iterations?
              self.running = false
              break
            end
          end

          sleep if running?
        rescue SystemExit; raise
        rescue Exception => err
          if continue_on_error
            threaded.logger.error err
          else
            threaded.logger.fatal err
            raise err
          end
        end
      end
    ensure
      if threaded.respond_to?(:after_stopping) and !self.running
        threaded.after_stopping
      end
      self.running = false
    end  # @private

    def join( limit = nil )
      return if thread.nil?
      limit ? thread.join(limit) : thread.join
    end  # @private

    def finished_iterations?
      return true if maximum_iterations and (iterations >= maximum_iterations)
      return false
    end  # @private

    alias :running? :running

    # Mark the start time of the run loop.
    #
    def mark_time
      @mark = Time.now if use_strict_interval
    end  # @private

    # Sleep for "interval" seconds adjusting for the run time of the "run"
    # method if the "use_strict_interval" flag is set. If the run time of the
    # "run" method exceeds our sleep "interval", then log a warning and just
    # use the interval as normal for this sleep period.
    #
    def sleep
      time_to_sleep = interval

      if use_strict_interval and interval > 0
        diff = Time.now - @mark
        time_to_sleep = interval - diff

        if time_to_sleep < 0
          time_to_sleep = interval
          logger.warn "Run time [#{diff} s] exceeded strict interval [#{interval} s]"
        end
      end

      ::Kernel.sleep time_to_sleep
    end  # @private
  }
  # :startdoc:

end

