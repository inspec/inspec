# encoding: utf-8
# author: Christoph Hartmann

require 'json'

# a simple streaming json logger
class Logger::JSONFormatter < Logger::Formatter
  def call(severity, time, progname, msg)
    puts JSON.generate(
      {
        'progname'=> progname,
        'severity'=> severity,
        'time'=> time,
        'msg'=> msg,
      },)
  end
end
