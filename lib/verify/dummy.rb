# encoding: utf-8
# Copyright 2014 Dominik Richter. All rights reserved.
# author: Dominik Richter
# author: Christoph Hartmann

# Spec file for Vulcano specs

# Get types
module DummyTestTypes
  # a few commands with special handling
  def describe(*_args); end

  def context(*_args); end

  def os
    {}
  end

  def command(_sth)
    res = OpenStruct.new
    res.stdout = ''
    res.stderr = ''
    res
  end
end

module DummyVulcanoTypes
  %w{
    attributes registry_key
  }.each do |name|
    define_method name do |*_arg|
    end
  end

  def processes(*_args)
    []
  end

  def start_postgres_session(*_args)
    Describer.new
  end

  def start_mysql_session(*_args)
    Describer.new
  end

  class Describer
    def describe(*_args); end
  end
end

class SshConf
  def initialize(*_args); end
end
class PostgresConf
  def initialize(*_args); end

  def params(*_a, &_b)
    {}
  end
end

class MysqlConf
  def initialize(*_args); end

  def params(*_a, &_b)
    {}
  end
end
