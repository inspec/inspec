# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'shellwords'

class CommandWrapper
  UNIX_SHELLS = %w{sh bash zsh}.freeze

  def self.wrap(cmd, options)
    unless options.is_a?(Hash)
      raise 'All options for the command wrapper must be provided as a hash. '\
        "You entered: #{options.inspect}. Please consult the documentation."
    end

    wrap = options[:wrap]
    if !wrap.nil? && !wrap.is_a?(Proc)
      raise "Called command wrapper with wrap: #{wrap.inspect}. It must be called with a Proc."
    elsif !wrap.nil?
      return wrap.call(cmd)
    end

    shell = options[:shell]
    unless UNIX_SHELLS.include?(shell)
      raise "Don't know how to wrap commands for shell: #{shell.inspect}."
    end

    path = options[:path] || shell
    args = options[:args] || '-c'
    path.to_s + ' ' + args + ' ' + Shellwords.escape(cmd)
  end
end
