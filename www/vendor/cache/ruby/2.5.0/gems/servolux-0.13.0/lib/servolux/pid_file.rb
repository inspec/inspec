# == Synopsis
# The PidFile manages the lifecycle of a PID file.
#
# == Details
# A PID file contains the process ID of a given program. This file can be used
# by the program to indicate that it started successfully. The file can be used
# programmatically to look up the process ID and send signals to the program.
# The file can be used to ensure two instances of the same program are not
# started at the same time.
#
# The PidFile class supports creating and deleting PID files. Methods are
# provided to check if the program associated with the PID is `alive?`. Signals
# can be sent to the program using the `kill` method.
#
# == Examples
#
# Here is a simple example creating a PID file in the "/var/run" directory.
#
#   pid_file = Servolux::PidFile.new(:name => "test", :path => "/var/run")
#   pid_file.filename  #=> "/var/run/test.pid"
#   pid_file.write
#
# From another process we can access this PID file and send a `HUP` signal to
# the program.
#
#   pid_file = Servolux::PidFile.new(:name => "test", :path => "/var/run")
#   pid_file.kill("HUP") if pid_file.alive?
#
class Servolux::PidFile

  DEFAULT_MODE = 0640

  attr_accessor :name     # the process name
  attr_accessor :path     # the path to the PID file
  attr_accessor :mode     # PID file permissions mode
  attr_accessor :logger   # logger for outputting messages

  # Create a new PID file instance.
  #
  # opts - The options Hash
  #   :name   - the name of the program
  #   :path   - path to the PID file location
  #   :mode   - file permissions mode
  #   :logger - logger for outputting messages
  #
  def initialize( opts = {} )
    @name   = opts.fetch(:name, $0)
    @path   = opts.fetch(:path, ".")
    @mode   = opts.fetch(:mode, DEFAULT_MODE)
    @logger = opts.fetch(:logger, Servolux::NullLogger())

    yield self if block_given?
  end

  # Returns the full name of the PID file including path and extension.
  def filename
    fn = name.to_s.downcase.tr(" ","_") + ".pid"
    fn = File.join(path, fn) unless path.nil?
    fn
  end

  # Writes the given `pid` to the PID file. The `pid` defaults to the current
  # process ID.
  #
  # pid - The process ID to write to the file
  #
  # Returns the filename of PID file.
  # Raises Errno::EACCESS if you do not have permission to write the file.
  def write( pid = Process.pid )
    fn = filename
    logger.debug "Writing pid file #{fn.inspect}"
    File.open(fn, 'w', mode) { |fd| fd.write(pid.to_s) }
    fn
  end

  # Delete the PID file if it exists. This method first checks that the current
  # process PID is the same as the PID stored in the file. If the PIDs do not
  # match, then this method returns `nil` without taking any action.
  #
  # Returns the filename of the deleted file or `nil` if no action was taken.
  # Raises Errno::EACCESS if you do not have permission to delete the file.
  def delete
    return unless pid == Process.pid
    fn = filename
    logger.debug "Deleting pid file #{fn.inspect}"
    File.delete fn
    fn
  end

  # Forcibly delete the PID file if it exists. This method does NOT check that
  # the current process PID against the PID stored in the file.
  #
  # Returns the filename of the deleted file or `nil` if no action was taken.
  # Raises Errno::EACCESS if you do not have permission to delete the file.
  def delete!
    return unless exist?
    fn = filename
    logger.debug "Deleting pid file #{fn.inspect}"
    File.delete fn
    fn
  end

  # Returns `true` if the PID file exists. Returns `false` otherwise.
  def exist?
    File.exist? filename
  end

  # Returns the numeric PID read from the file or `nil` if the file does not
  # exist. If you do not have permission to access the file `nil` is returned.
  def pid
    fn = filename
    Integer(File.read(fn).strip) if File.exist?(fn)
  rescue Errno::EACCES => err
    logger.error "You do not have access to the PID file at " \
                 "#{fn.inspect}: #{err.message}"
    nil
  end

  # Returns `true` if the process is currently running. Returns `false` if this
  # is not the case. The status of the process is determined by sending signal 0
  # to the process.
  def alive?
    pid = self.pid
    return if pid.nil?

    Process.kill(0, pid)
    true
  rescue Errno::ESRCH, Errno::ENOENT
    false
  end

  # Send a signal the process identified by the PID file. The default signal to
  # send is 'INT' (2). The signal can be given either as a string or a signal
  # number.
  #
  # signal - The signal to send to the process (String or Integer)
  #
  # Returns an Integer or `nil` if an error was encountered.
  def kill( signal = 'INT' )
    pid = self.pid
    return if pid.nil?

    signal = Signal.list.invert[signal] if signal.is_a?(Integer)
    logger.info "Killing PID #{pid} with #{signal}"
    Process.kill(signal, pid)

  rescue Errno::EINVAL
    logger.error "Failed to kill PID #{pid} with #{signal}: " \
                 "'#{signal}' is an invalid or unsupported signal number."
    nil
  rescue Errno::EPERM
    logger.error "Failed to kill PID #{pid} with #{signal}: " \
                 "Insufficient permissions."
    nil
  rescue Errno::ESRCH
    logger.error "Failed to kill PID #{pid} with #{signal}: " \
                 "Process is deceased or zombie."
    nil
  rescue Errno::EACCES => err
    logger.error err.message
    nil
  rescue Errno::ENOENT => err
    logger.error "Could not find a PID file at #{pid_file.inspect}. " \
                 "Most likely the process is no longer running."
    nil
  rescue Exception => err
    unless err.is_a?(SystemExit)
      logger.error "Failed to kill PID #{pid} with #{signal}: #{err.message}"
    end
    nil
  end
end
