require 'socket'

# == Synopsis
# A Piper is used to fork a child process and then establish a communication
# pipe between the parent and child. This communication pipe is used to pass
# Ruby objects between the two.
#
# == Details
# When a new piper instance is created, the Ruby process is forked into two
# processes - the parent and the child. Each continues execution from the
# point of the fork. The piper establishes a pipe for communication between
# the parent and the child. This communication pipe can be opened as read /
# write / read-write (from the perspective of the parent).
#
# Communication over the pipe is handled by marshalling Ruby objects through
# the pipe. This means that nearly any Ruby object can be passed between the
# two processes. For example, exceptions from the child process can be
# marshalled back to the parent and raised there.
#
# Object passing is handled by use of the +puts+ and +gets+ methods defined
# on the Piper. These methods use a +timeout+ and the Kernel#select method
# to ensure a timely return.
#
# == Examples
#
#    piper = Servolux::Piper.new('r', :timeout => 5)
#
#    piper.parent {
#      $stdout.puts "parent pid #{Process.pid}"
#      $stdout.puts "child pid #{piper.pid} [from fork]"
#
#      child_pid = piper.gets
#      $stdout.puts "child pid #{child_pid} [from child]"
#
#      msg = piper.gets
#      $stdout.puts "message from child #{msg.inspect}"
#    }
#
#    piper.child {
#      sleep 2
#      piper.puts Process.pid
#      sleep 3
#      piper.puts "The time is #{Time.now}"
#    }
#
#    piper.close
#
class Servolux::Piper

  # :stopdoc:
  SIZEOF_INT = [42].pack('I').size  # @private
  # :startdoc:

  # Creates a new Piper with the child process configured as a daemon. The
  # +pid+ method of the piper returns the PID of the daemon process.
  #
  # By default a daemon process will release its current working directory
  # and the stdout/stderr/stdin file descriptors. This allows the parent
  # process to exit cleanly. This behavior can be overridden by setting the
  # _nochdir_ and _noclose_ flags to true. The first will keep the current
  # working directory; the second will keep stdout/stderr/stdin open.
  #
  # @param [Boolean] nochdir Do not change working directories
  # @param [Boolean] noclose Do not close stdin, stdout, and stderr
  # @return [Piper]
  #
  def self.daemon( nochdir = false, noclose = false )
    piper = self.new(:timeout => 1)
    piper.parent {
      pid = piper.gets
      raise ::Servolux::Error, 'Could not get the child PID.' if pid.nil?

      piper.wait                                     # reap the child process
      piper.instance_variable_set(:@child_pid, pid)  # adopt the grandchild
    }
    piper.child {
      Process.setsid                     # Become session leader.
      exit!(0) if fork                   # Zap session leader.

      Dir.chdir '/' unless nochdir       # Release old working directory.
      File.umask 0000                    # Ensure sensible umask.

      unless noclose
        STDIN.reopen  '/dev/null'        # Free file descriptors and
        STDOUT.reopen '/dev/null', 'a'   # point them somewhere sensible.
        STDERR.reopen '/dev/null', 'a'
      end

      piper.puts Process.pid
    }
    return piper
  end

  # The timeout in seconds to wait for puts / gets commands.
  attr_accessor :timeout

  # The underlying socket the piper is using for communication.
  attr_reader :socket

  # @overload Piper.new( mode = 'r', opts = {} )
  #   Creates a new Piper instance with the communication pipe configured
  #   using the provided _mode_. The default mode is read-only (from the
  #   parent, and write-only from the child). The supported modes are as
  #   follows:
  #
  #      Mode | Parent View | Child View
  #      -------------------------------
  #      r      read-only     write-only
  #      w      write-only    read-only
  #      rw     read-write    read-write
  #
  #   @param [String] mode The communication mode of the pipe.
  #   @option opts [Numeric] :timeout (nil)
  #     The number of seconds to wait for a +puts+ or +gets+ to succeed. If not
  #     specified, calls through the pipe will block forever until data is
  #     available. You can configure the +puts+ and +gets+ to be non-blocking
  #     by setting the timeout to +0+.
  #   @return [Piper]
  #
  def initialize( *args )
    opts = args.last.is_a?(Hash) ? args.pop : {}
    mode = args.first || 'r'

    unless %w[r w rw].include? mode
      raise ArgumentError, "Unsupported mode #{mode.inspect}"
    end

    @status = nil
    @timeout = opts.fetch(:timeout, nil)
    socket_pair = Socket.pair(Socket::AF_UNIX, Socket::SOCK_STREAM, 0)
    @child_pid = Kernel.fork

    if child?
      @socket = socket_pair[1]
      socket_pair[0].close

      case mode
      when 'r'; @socket.close_read
      when 'w'; @socket.close_write
      end
    else
      @socket = socket_pair[0]
      socket_pair[1].close

      case mode
      when 'r'; @socket.close_write
      when 'w'; @socket.close_read
      end
    end
  end

  # Close both the communications socket. This only affects the process from
  # which it was called -- the parent or the child.
  #
  # @return [Piper] self
  #
  def close
    @socket.close unless @socket.closed?
    self
  end

  # Returns +true+ if the piper has been closed. Returns +false+ otherwise.
  #
  # @return [Boolean]
  #
  def closed?
    @socket.closed?
  end

  # Returns +true+ if the communications pipe is readable from the process
  # and there is data waiting to be read.
  #
  # @return [Boolean]
  #
  def readable?
    return false if @socket.closed?
    r,_,_ = Kernel.select([@socket], nil, nil, @timeout) rescue nil
    return !(r.nil? or r.empty?)
  end

  # Returns +true+ if the communications pipe is writeable from the process
  # and the write buffer can accept more data.
  #
  # @return [Boolean]
  #
  def writeable?
    return false if @socket.closed?
    _,w,_ = Kernel.select(nil, [@socket], nil, @timeout) rescue nil
    return !(w.nil? or w.empty?)
  end

  # Execute the _block_ only in the child process. This method returns
  # immediately when called from the parent process. The piper instance is
  # passed to the block if the arity is non-zero.
  #
  # @yield [self] Execute the block in the child process
  # @yieldparam [Piper] self The piper instance (optional)
  # @return The return value from the block or +nil+ when called from the
  #   parent.
  #
  def child( &block )
    return unless child?
    raise ArgumentError, "A block must be supplied" if block.nil?

    if block.arity > 0
      block.call(self)
    else
      block.call
    end
  end

  # Returns +true+ if this is the child process and +false+ otherwise.
  #
  # @return [Boolean]
  #
  def child?
    @child_pid.nil?
  end

  # Execute the _block_ only in the parent process. This method returns
  # immediately when called from the child process. The piper instance is
  # passed to the block if the arity is non-zero.
  #
  # @yield [self] Execute the block in the parent process
  # @yieldparam [Piper] self The piper instance (optional)
  # @return The return value from the block or +nil+ when called from the
  #   child.
  #
  def parent( &block )
    return unless parent?
    raise ArgumentError, "A block must be supplied" if block.nil?

    if block.arity > 0
      block.call(self)
    else
      block.call
    end
  end

  # Returns +true+ if this is the parent process and +false+ otherwise.
  #
  # @return [Boolean]
  #
  def parent?
    !@child_pid.nil?
  end

  # Returns the PID of the child process when called from the parent.
  # Returns +nil+ when called from the child.
  #
  # @return [Integer, nil] The PID of the child process or +nil+
  #
  def pid
    @child_pid
  end

  # Read an object from the communication pipe. If data is available then it
  # is un-marshalled and returned as a Ruby object. If the pipe is closed for
  # reading or if no data is available then the _default_ value is returned.
  # You can pass in the _default_ value; otherwise it will be +nil+.
  #
  # This method will block until the +timeout+ is reached or data can be
  # read from the pipe.
  #
  def gets( default = nil )
    return default unless readable?

    data = @socket.read SIZEOF_INT
    return default if data.nil?

    size = data.unpack('I').first
    data = @socket.read size
    return default if data.nil?

    Marshal.load(data) rescue data
  rescue SystemCallError
    return default
  end

  # Write an object to the communication pipe. Returns +nil+ if the pipe is
  # closed for writing or if the write buffer is full. The _obj_ is
  # marshalled and written to the pipe (therefore, procs and other
  # un-marshallable Ruby objects cannot be passed through the pipe).
  #
  # If the write is successful, then the number of bytes written to the pipe
  # is returned. If this number is zero it means that the _obj_ was
  # unsuccessfully communicated (sorry).
  #
  # @param [Object] obj The data to send to the "other" process. The object
  #   must be marshallable by Ruby (no Proc objects or lambdas).
  # @return [Integer, nil] The number of bytes written to the pipe or +nil+ if
  #   there was an error or the pipe is not writeable.
  #
  def puts( obj )
    return unless writeable?

    data = Marshal.dump(obj)
    @socket.write([data.size].pack('I')) + @socket.write(data)
  rescue SystemCallError
    return nil
  end

  # Send the given signal to the child process. The signal may be an integer
  # signal number or a POSIX signal name (either with or without a +SIG+
  # prefix).
  #
  # This method does nothing when called from the child process.
  #
  # @param [String, Integer] sig The signal to send to the child process.
  # @return [Integer, nil] The result of Process#kill or +nil+ if called from
  #   the child process.
  #
  def signal( sig )
    return if child?
    return unless alive?
    Process.kill(sig, @child_pid)
  end

  # Waits for the child process to exit and returns its exit status. The
  # global variable $? is set to a Process::Status object containing
  # information on the child process.
  #
  # Always returns +nil+ when called from the child process.
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
    return if child?
    _, @status = Process.wait2(@child_pid, flags) unless @status
    exitstatus
  rescue Errno::ECHILD
    nil
  end

  # Returns +true+ if the child process is alive. Returns +nil+ if the child
  # process has not been started.
  #
  # Always returns +nil+ when called from the child process.
  #
  # @return [Boolean, nil]
  #
  def alive?
    return if child?
    wait(Process::WNOHANG|Process::WUNTRACED)
    Process.kill(0, @child_pid)
    true
  rescue Errno::ESRCH, Errno::ENOENT, Errno::ECHILD
    false
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
end

