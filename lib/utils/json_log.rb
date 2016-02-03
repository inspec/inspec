# encoding: utf-8
# author: Christoph Hartmann

require 'json'

# a simple streaming json logger
class Logger::JSONFormatter < Logger::Formatter
  def initialize
    @first = true
    puts '['
  end

  def stop
    puts ']'
  end

  def call(severity, time, progname, msg)
    if @first == false
      print ','
    else
      @first = false
      print ' '
    end
    puts JSON.generate(
      {
        'progname'=> progname,
        'severity'=> severity,
        'time'=> time,
        'msg'=> msg,
      },)
  end
end
