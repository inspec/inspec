
# == Synopsis
# Manage a child process spawned via IO#popen and provide a timeout
# mechanism to kill the process after some amount time.
#
# == Details
# Ruby provides the IO#popen method to spawn a child process and return an
# IO instance connected to the child's stdin and stdout (with stderr
# redirected to stdout). The Servolux::Child class adds to this a timeout
# thread that will signal the child process after some number of seconds.
# If the child exits cleanly before the timeout expires then no signals are
# sent to the child.
#
# A list of signals can be provided which will be sent in succession to the
# child until one of them causes the child to exit. The current Ruby thread
# suspends for a few seconds to allow each signal to be processed by the
# child. By default these signals are SIGTERM, SIGQUIT, SIGKILL and the time
# to wait between signals is four seconds.
#
# The +stop+ method is used to stop the child process (if running) and to
# reset the state of the Child instance so that it can be started again.
# Stopping the Child instance closes the IO between parent and child
# process.
#
# The +wait+ method is used to wait for the child process to exit. The
# Process::Status object is retrieved by the Child and stored as an instance
# variable. The +exitstatus+ method (and the other process related methods)
# will return non-nil values after the wait method is called.
#
# == Examples
#
#    child = Servolux::Child.new(:command => 'sleep 120', :timeout => 10)
#    child.start
#    child.wait
#
#    child.timed_out?    #=> true
#    child.signaled?     #=> true
#    child.exitstatus    #=> nil
#
class Servolux::Child

  attr_accessor :command
  attr_accessor :timeout
  attr_accessor :signals
  attr_accessor :suspend
  attr_reader :io
  attr_reader :pid

  # Create a new Child that will execute and manage the +command+ string as
  # a child process.
  #
  # @option opts [String] :command
  #   The command that will be executed via IO#popen.
  #
  # @option opts [Numeric] :timeout (nil)
  #   The number of seconds to wait before terminating the child process.
  #   No action is taken if the child process exits normally before the
  #   timeout expires.
  #
  # @option opts [Array<String, Integer>] :signals (['TERM', 'QUIT', 'KILL'])
  #   A list of signals that will be sent to the child process when the
  #   timeout expires. The signals increase in severity with SIGKILL being
  #   the signal of last resort.
  #
  # @option opts [Numeric] :suspend (4)
  #   The number of seconds to wait for the child process to respond to a
  #   signal before trying the next one in the list.
  #
  def initialize( opts = {} )
    @command = opts.fetch(:command, nil)
    @timeout = opts.fetch(:timeout, nil)
    @signals = opts.fetch(:signals, %w[TERM QUIT KILL])
    @suspend = opts.fetch(:suspend, 4)
    @io = @pid = @status = @thread = @timed_out = nil
    yield self if block_given?
  end

  # Runs the +command+ string as a subprocess; the subprocess’s
  # standard input and output will be connected to the returned IO object.
  # The default mode for the new file object is "r", but mode may be set to
  # any of the modes listed in the description for class IO.
  #
  # If a block is given, Ruby will run the +command+ as a child connected to
  # Ruby with a pipe. Ruby’s end of the pipe will be passed as a parameter
  # to the block. In this case the value of the block is returned.
  #
  # @param [String] mode The mode flag used to open the child process via
  #   IO#popen.
  # @yield [IO] Execute the block of call passing in the communication pipe
  #   with the child process.
  # @yieldreturn Returns the result of the block.
  # @return [IO] The communication pipe with the child process or the return
  #   value from the block if one was given.
  #
  def start( mode = 'r', &block )
    start_timeout_thread if @timeout

    @io = IO::popen @command, mode
    @pid = @io.pid
    @status = nil

    return block.call(@io) unless block.nil?
    @io
  end

  # Stop the child process if it is alive. A sequence of +signals+ are sent
  # to the process until it dies with SIGKILL being the signal of last
  # resort.
  #
  # After this method returns, the IO pipe to the child will be closed and
  # the stored child PID is set to +nil+. The +start+ method can be safely
  # called again.
  #
  # @return self
  #
  def stop
    unless @thread.nil?
      t, @thread = @thread, nil
      t[:stop] = true
      t.wakeup.join if t.status
    end

    kill if alive?
    @io.close unless @io.nil? || @io.closed?
    @io = nil
    self
  end

  # Waits for the child process to exit and returns its exit status. The
  # global variable $? is set to a Process::Status object containing
  # information on the child process.
  #
  # You can get more information about how the child status exited by calling
  # the following methods on the piper instance:
  #
  #   * coredump?
  #   * exited?
  #   * signaled?
  #   * stopped?
  #   * success?
  #   * exitstatus
  #   * stopsig
  #   * termsig
  #
  # @param [Integer] flags Bit flags that will be passed to the system level
  #   wait call. See the Ruby core documentation for Process#wait for more
  #   information on these flags.
  # @return [Integer, nil] The exit status of the child process or +nil+ if
  #   the child process is not running.
  #
  def wait( flags = 0 )
    return if @pid.nil?
    _, @status = Process.wait2(@pid, flags) unless @status
    exitstatus
  end

  # Returns +true+ if the child process is alive. Returns +nil+ if the child
  # process has not been started.
  #
  # @return [Boolean]
  #
  def alive?
    return if @pid.nil?
    wait(Process::WNOHANG|Process::WUNTRACED)
    Process.kill(0, @pid)
    true
  rescue Errno::ESRCH, Errno::ENOENT
    false
  end

  # Returns +true+ if the child process was killed by the timeout thread.
  #
  # @return [Boolean]
  #
  def timed_out?
    @timed_out
  end

  %w[coredump? exited? signaled? stopped? success? exitstatus stopsig termsig].
  each { |method|
    self.class_eval <<-CODE
      def #{method}
        return if @status.nil?
        @status.#{method}
      end
    CODE
  }


  private

  # Attempt to kill the child process by sending the configured +signals+
  # and waiting for +suspend+ seconds between each signal; this gives the
  # child time to respond to the signal.
  #
  # Returns +true+ if the child died. Returns +false+ if the child is still
  # not dead after the last signal was sent. Returns +nil+ if the child was
  # not running in the first place.
  #
  def kill
    return if @io.nil?

    existed = false
    @signals.each do |sig|
      begin
        Process.kill sig, @pid
        existed = true
      rescue Errno::ESRCH, Errno::ENOENT
        return(existed ? nil : true)
      end
      return true unless alive?
      sleep @suspend
      return true unless alive?
    end
    return !alive?
  end

  def start_timeout_thread
    @timed_out = false
    @thread = Thread.new(self) { |child|
      sleep @timeout
      unless Thread.current[:stop]
        if child.alive?
          child.instance_variable_set(:@timed_out, true)
          child.__send__(:kill)
        end
      end
    }
  end

end

