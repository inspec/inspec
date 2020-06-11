module Servolux

  # :stopdoc:
  LIBPATH = ::File.expand_path(::File.dirname(__FILE__)) + ::File::SEPARATOR
  PATH = ::File.dirname(LIBPATH) + ::File::SEPARATOR
  # :startdoc:

  # Generic Servolux Error class.
  Error = Class.new(StandardError)

  # Returns the library path for the module. If any arguments are given,
  # they will be joined to the end of the library path using
  # <tt>File.join</tt>.
  #
  # @return [String] absolute servolux 'lib' path
  #
  def self.libpath( *args )
    args.empty? ? LIBPATH : ::File.join(LIBPATH, args.flatten)
  end

  # Returns the lpath for the module. If any arguments are given,
  # they will be joined to the end of the servolux base path using
  # <tt>File.join</tt>.
  #
  # @return [String] absolute servolux base path
  #
  def self.path( *args )
    args.empty? ? PATH : ::File.join(PATH, args.flatten)
  end

  # Returns +true+ if the execution platform supports fork.
  #
  # @return [Boolean]
  #
  def self.fork?
    RUBY_PLATFORM != 'java' and test(?e, '/dev/null')
  end
end

%w[version threaded child daemon null_logger pid_file piper prefork server].each do |lib|
  require Servolux.libpath('servolux', lib)
end
