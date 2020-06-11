
# == Synopsis
# The Prefork class provides a pre-forking worker pool for executing tasks in
# parallel using multiple processes.
#
# == Details
# A pre-forking worker pool is a technique for executing code in parallel in a
# UNIX environment. Each worker in the pool forks a child process and then
# executes user supplied code in that child process. The child process can
# pull jobs from a queue (beanstalkd for example) or listen on a socket for
# network requests.
#
# The code to execute in the child processes is passed as a block to the
# Prefork initialize method. The child processes executes this code in a loop;
# that is, your code block should not worry about keeping itself alive. This
# is handled by the library.
#
# If your code raises an exception, it will be captured by the library code
# and marshalled back to the parent process. This will halt the child process.
# The Prefork worker pool does not restart dead workers. A method is provided
# to iterate over workers that have errors, and it is up to the user to handle
# errors as they please.
#
# Instead of passing a block to the initialize method, you can provide a Ruby
# module that defines an "execute" method. This method will be executed in the
# child process' run loop. When using a module, you also have the option of
# defining a "before_executing" method and an "after_executing" method. These
# methods will be called before the child starts the execute loop and after
# the execute loop finishes. Each method will be called exactly once. Both
# methods are optional.
#
# Sending a SIGHUP to a child process will cause that child to stop and
# restart. The child will send a signal to the parent asking to be shutdown.
# The parent will gracefully halt the child and then start a new child process
# to replace it. If you define a "hup" method in your worker module, it will
# be executed when SIGHUP is received by the child. Your "hup" method will be
# the last method executed in the signal handler.
#
# This has the advantage of calling your before/after_executing methods again
# and reloading any code or resources your worker code will use. The SIGHUP
# will call Thread#wakeup on the main child process thread; please write your
# code to respond accordingly to this wakeup call (a thread waiting on a
# Queue#pop will not return when wakeup is called on the thread).
#
# == Examples
#
# A pre-forking echo server: http://github.com/TwP/servolux/blob/master/examples/echo.rb
#
# Pulling jobs from a beanstalkd work queue: http://github.com/TwP/servolux/blob/master/examples/beanstalk.rb
#
# ==== Before / After Executing
# In this example, we are creating 42 worker processes that will log the
# process ID and the current time to a file. Each worker will do this every 2
# seconds. The before/after_executing methods are used to open the file before
# the run loop starts and to close the file after the run loop completes. The
# execute method uses the stored file descriptor when logging the message.
#
#    module RunMe
#      def before_executing
#        @fd = File.open("#{Process.pid}.txt", 'w')
#      end
#
#      def after_executing
#        @fd.close
#      end
#
#      def execute
#        @fd.puts "Process #{Process.pid} @ #{Time.now}"
#        sleep 2
#      end
#    end
#
#    pool = Servolux::Prefork.new(:module => RunMe)
#    pool.start 42
#
# ==== Heartbeat
# When a :timeout is supplied to the constructor, a "heartbeat" is setup
# between the parent and the child worker. Each loop through the child's
# execute code must return before :timeout seconds have elapsed. If one
# iteration through the loop takes longer than :timeout seconds, then the
# parent process will halt the child worker. An error will be raised in the
# parent process.
#
#    pool = Servolux::Prefork.new(:timeout => 2) {
#      puts "Process #{Process.pid} is running."
#      sleep(rand * 5)
#    }
#    pool.start 42
#
# Eventually all 42 child processes will be killed by their parents. The
# random number generator will eventually cause the child to sleep longer than
# two seconds.
#
# What is happening here is that each time the child processes executes the
# block of code, the Servolux library code will send a "heartbeat" message to
# the parent. The parent is using a Kernel#select call on the communications
# pipe to wait for this message. The timeout is passed to the select call, and
# this will cause it to return +nil+ -- this is the error condition the
# heartbeat prevents.
#
# Use the heartbeat with caution -- allow margins for timing issues and
# processor load spikes.
#
# ==== Signals
# Forked child processes are configured to respond to two signals: SIGHUP and
# SIGTERM. The SIGHUP signal when sent to a child process is used to restart
# just that one child. The SIGTERM signal when sent to a child process is used
# to forcibly kill the child; it will not be restarted. The parent process
# uses SIGTERM to halt all the children when it is stopping.
#
# SIGHUP
# Child processes are restarted by sending a SIGHUP signal to the child. This
# will shutdown the child worker and then start up a new one to replace it.
# For the child to shutdown gracefully, it needs to return from the "execute"
# method when it receives the signal. Define a "hup" method that will wake the
# execute thread from any pending operations -- listening on a socket, reading
# a file, polling a queue, etc. When the execute method returns, the child
# will exit.
#
# SIGTERM
# Child processes are stopped by the prefork parent by sending a SIGTERM
# signal to the child. For the child to shutdown gracefully, it needs to
# return from the "execute" method when it receives the signal. Define a
# "term" method that will wake the execute thread from any pending operations
# -- listening on a socket, reading a file, polling a queue, etc. When the
# execute method returns, the child will exit.
#
class Servolux::Prefork

  CommunicationError = Class.new(::Servolux::Error)
  UnknownSignal = Class.new(::Servolux::Error)
  UnknownResponse = Class.new(::Servolux::Error)

  # :stopdoc:
  START = "\000START".freeze     # @private
  HALT = "\000HALT".freeze       # @private
  ERROR = "\000SHIT".freeze      # @private
  HEARTBEAT = "\000<3".freeze    # @private
  # :startdoc:

  attr_accessor :timeout     # Communication timeout in seconds.
  attr_accessor :min_workers # Minimum number of workers
  attr_accessor :max_workers # Maximum number of workers
  attr_accessor :config      # Worker configuration options (a Hash)

  # call-seq:
  #    Prefork.new { block }
  #    Prefork.new( :module => Module )
  #
  # Create a new pre-forking worker pool. You must provide a block of code for
  # the workers to execute in their child processes. This code block can be
  # passed either as a block to this method or as a module via the :module
  # option.
  #
  # If a :timeout is given, then each worker will setup a "heartbeat" between
  # the parent process and the child process. If the child does not respond to
  # the parent within :timeout seconds, then the child process will be halted.
  # If you do not want to use the heartbeat then leave the :timeout unset or
  # manually set it to +nil+.
  #
  # Additionally, :min_workers and :max_workers options are avilable. If
  # :min_workers is given, the method +ensure_worker_pool_size+ will guarantee
  # that at least :min_workers are up and running. If :max_workers is given,
  # then +add_workers+ will NOT allow ou to spawn more workers than
  # :max_workers.
  #
  # The pre-forking worker pool makes no effort to restart dead workers. It is
  # left to the user to implement this functionality.
  #
  def initialize( opts = {}, &block )
    @timeout = opts.fetch(:timeout, nil)
    @module = opts.fetch(:module, nil)
    @max_workers = opts.fetch(:max_workers, nil)
    @min_workers = opts.fetch(:min_workers, nil)
    @config = opts.fetch(:config, {})
    @module = Module.new { define_method :execute, &block } if block
    @workers = []

    raise ArgumentError, 'No code was given to execute by the workers.' unless @module
  end

  # Start up the given _number_ of workers. Each worker will create a child
  # process and run the user supplied code in that child process.
  #
  # @param [Integer] number The number of workers to prefork
  # @return [Prefork] self
  #
  def start( number )
    @workers.clear
    add_workers( number )
   self
  end

  # Stop all workers. The current process will wait for each child process to
  # exit before this method will return. The worker instances are not
  # destroyed by this method; this means that the +each_worker+ and the
  # +errors+ methods will still function correctly after stopping the workers.
  #
  def stop
    @workers.each { |worker| worker.stop; pause }
    reap
    self
  end

  # This method should be called periodically in order to clear the return
  # status from child processes that have either died or been restarted (via a
  # HUP signal). This will remove zombie children from the process table.
  #
  # @return [Prefork] self
  #
  def reap
    @workers.each { |worker| worker.reap }
    self
  end

  # Send this given _signal_ to all child process. The default signal is
  # 'TERM'. The method waits for a short period of time after the signal is
  # sent to each child; this is done to alleviate a flood of signals being
  # sent simultaneously and overwhelming the CPU.
  #
  # @param [String, Integer] signal The signal to send to child processes.
  # @return [Prefork] self
  #
  def signal( signal = 'TERM' )
    @workers.each { |worker| worker.signal(signal); pause }
    self
  end
  alias :kill :signal

  # call-seq:
  #    each_worker { |worker| block }
  #
  # Iterates over all the workers and yields each, in turn, to the given
  # _block_.
  #
  def each_worker( &block )
    @workers.each(&block)
    self
  end

  # call-seq:
  #    add_workers( number = 1 )
  #
  # Adds additional workers to the pool. It will not add more workers than
  # the number set in :max_workers
  #
  def add_workers( number = 1 )
    number.times do
      break if at_max_workers?
      worker = Worker.new(self, @config)
      worker.extend @module
      worker.start
      @workers << worker
      pause
    end
  end

  # call-seq:
  #    prune_workers()
  #
  # Remove workers that are no longer alive from the worker pool
  #
  def prune_workers
    new_workers = @workers.find_all { |w| w.reap.alive? }
    @workers = new_workers
  end

  # call-seq:
  #   ensure_worker_pool_size()
  #
  # Make sure that the worker pool has >= the minimum number of workers and less
  # than the maximum number of workers.
  #
  # Generally, this means prune the number of workers and then spawn workers up
  # to the min_worker level. If min is not set, then we only prune
  #
  def ensure_worker_pool_size
    prune_workers
    while below_minimum_workers? do
      add_workers
    end
  end

  # call-seq:
  #   below_minimum_workers?
  #
  # Report if the number of workers is below the minimum threshold
  #
  def below_minimum_workers?
    return false unless @min_workers
    return @workers.size < @min_workers
  end

  # call-seq:
  #    at_max_workers?
  #
  # Return true or false if we are currently at or above the maximum number of
  # workers allowed.
  #
  def at_max_workers?
    return false unless @max_workers
    return @workers.size >= @max_workers
  end

  # call-seq:
  #    errors { |worker| block }
  #
  # Iterates over all the workers and yields the worker to the given _block_
  # only if the worker has an error condition.
  #
  def errors
    @workers.each { |worker| yield worker unless worker.error.nil? }
    self
  end

  # call-seq:
  #    worker_counts -> { :alive => 2, :dead => 1 }
  #
  # Returns a hash containing the counts of alive and dead workers
  def worker_counts
    counts = { :alive => 0, :dead => 0 }
    each_worker do |worker|
      state = worker.alive? ? :alive : :dead
      counts[state] += 1
    end
    return counts
  end

  # call-seq:
  #    live_worker_count -> Integer
  #
  # Returns the number of live workers in the pool
  def live_worker_count
    worker_counts[:alive]
  end

  # call-seq:
  #    dead_worker_count -> Integer
  #
  # Returns the number of dead workers in the pool
  def dead_worker_count
    worker_counts[:dead]
  end

private

  # Pause script execution for a random time interval between 0.1 and 0.4
  # seconds. This method is used to slow down the starting and stopping of
  # child processes in order to avoid the "thundering herd" problem.
  # http://en.wikipedia.org/wiki/Thundering_herd_problem
  #
  def pause
    sleep(0.1 + 0.3*rand)
  end

  # The worker encapsulates the forking of the child process and communication
  # between the parent and the child. Each worker instance is extended with
  # the block or module supplied to the pre-forking pool that created the
  # worker.
  #
  class Worker

    attr_reader :error

    attr_reader :config

    # Create a new worker that belongs to the _prefork_ pool.
    #
    # @param [Prefork] prefork The prefork pool that created this worker.
    # @param [Hash] config The worker configuration options.
    #
    def initialize( prefork, config )
      @timeout = prefork.timeout
      @config = config
      @thread = nil
      @piper = nil
      @error = nil
      @pid_list = []
    end

    # Start this worker. A new process will be forked, and the code supplied
    # by the user to the prefork pool will be executed in the child process.
    #
    # @return [Worker] self
    #
    def start
      @pid_list << @piper.pid if @piper
      @error = nil
      @piper = ::Servolux::Piper.new('rw', :timeout => @timeout)
      @piper.parent? ? parent : child
      self
    end

    # Stop this worker. The internal worker thread is stopped and a 'HUP'
    # signal is sent to the child process. This method will return immediately
    # without waiting for the child process to exit. Use the +wait+ method
    # after calling +stop+ if your code needs to know when the child exits.
    #
    # @return [Worker, nil] self
    #
    def stop
      return if @thread.nil? or @piper.nil? or @piper.child?

      @thread[:stop] = true
      @thread.wakeup if @thread.status
      close_parent
      signal 'TERM'
      @thread.join(0.5)
      @thread = nil
      self
    end

    # Wait for the child process to exit. This method returns immediately when
    # called from the child process or if the child process has not yet been
    # forked.
    #
    def wait
      return if @piper.nil? or @piper.child?
      @piper.wait(Process::WUNTRACED)
    end

    # Send this given _signal_ to the child process. The default signal is
    # 'TERM'. This method will return immediately.
    #
    # @param [String, Integer] signal The signal to send to the child process.
    # @return [Integer, nil] The result of Process#kill or +nil+ if called from
    #   the child process.
    #
    def signal( signal = 'TERM' )
      return if @piper.nil?
      @piper.signal signal
    rescue Errno::ESRCH, Errno::ENOENT
      return nil
    end
    alias :kill :signal

    # Returns +true+ if the child process is alive. Returns +nil+ if the child
    # process has not been started.
    #
    # Always returns +nil+ when called from the child process.
    #
    # @return [Boolean, nil]
    #
    def alive?
      return if @piper.nil?
      @piper.alive?
    end

    # Internal: Attempt to reap any child processes spawned by this worker. If a
    # child has exited, then we remove it from our PID list.
    #
    # @return [Worker] this worker instance.
    def reap
      @piper.alive? unless @piper.nil?
      @pid_list.dup.each do |pid|
        @pid_list.delete(pid) if reap?(pid)
      end
      self
    end

    # Internal: Check the return status of the given child PID. This will reap
    # the process from the kernel process table if the child has exited.
    #
    # @return [Boolean] true if the PID has exited; false otherwise.
    def reap?(pid)
      _, cstatus = Process.wait2(pid, Process::WNOHANG|Process::WUNTRACED)
      return true if cstatus
      Process.kill(0, pid)
      false
    rescue Errno::ESRCH, Errno::ENOENT, Errno::ECHILD
      true
    end

    # Returns +true+ if communication with the child process timed out.
    # Returns +nil+ if the child process has not been started.
    #
    # Always returns +nil+ when called from the child process.
    #
    # @return [Boolean, nil]
    #
    def timed_out?
      return if @piper.nil? or @piper.child?
      CommunicationError === @error
    end

    %w[pid coredump? exited? signaled? stopped? success? exitstatus stopsig termsig].
    each { |method|
      self.class_eval <<-CODE
        def #{method}
          return if @piper.nil?
          @piper.#{method}
        end
      CODE
    }

  private

    def close_parent
      @piper.timeout = 0.5
      @piper.puts HALT rescue nil
      @piper.close
    end

    # This code should only be executed in the parent process.
    #
    def parent
      @thread = Thread.new {
        begin
          @piper.puts START
          Thread.current[:stop] = false
          response = parent_loop
        rescue StandardError => err
          @error = err
        ensure
          close_parent
          start if START == response and !Thread.current[:stop]
        end
      }
      Thread.pass until @thread[:stop] == false
    end

    def parent_loop
      response = nil
      loop {
        break if Thread.current[:stop]
        break unless @piper.alive?
        @piper.puts HEARTBEAT
        response = @piper.gets(ERROR)
        break if Thread.current[:stop]

        case response
        when HEARTBEAT; next
        when START; break
        when ERROR
          raise CommunicationError,
                "Unable to read data from Child process. Possible timeout, closing of pipe and/or child death."
        when Exception
          @error = response
          break
        else
          raise UnknownResponse,
                "Child returned unknown response: #{response.inspect}"
        end
      }
      return response
    end

    # This code should only be executed in the child process. It wraps the
    # user supplied "execute" code in a loop, and takes care of handling
    # signals and communication with the parent.
    #
    def child

      # if we get a HUP signal, then tell the parent process to stop this
      # child process and start a new one to replace it
      Signal.trap('HUP') {
        @piper.timeout = 0.5
        @piper.puts START rescue nil
        hup if self.respond_to? :hup
      }

      Signal.trap('TERM') {
        @piper.close
        term if self.respond_to? :term
      }

      @thread = Thread.new {
        begin
          :wait until @piper.gets == START
          before_executing if self.respond_to? :before_executing
          child_loop
        rescue Exception => err
          @piper.puts err rescue nil
        ensure
          after_executing if self.respond_to? :after_executing
          @piper.close
        end
      }
      @thread.join
    ensure
      exit!
    end

    def child_loop
      loop {
        signal = @piper.gets(ERROR)
        case signal
        when HEARTBEAT
          execute
          @piper.puts HEARTBEAT
        when HALT
          break
        when ERROR
          raise CommunicationError,
                "Unable to read data from Parent process. Possible timeout, closing of pipe and/or parent death."
        else
          raise UnknownSignal,
                "Child received unknown signal: #{signal.inspect}"
        end
      }
    end
  end
end

