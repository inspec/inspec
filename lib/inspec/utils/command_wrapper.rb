# author: Dominik Richter
# author: Christoph Hartmann

require 'shellwords'

class CommandWrapper
  UNIX_SHELLS = %w{sh bash zsh ksh}.freeze

  def self.wrap(cmd, options)
    unless options.is_a?(Hash)
      raise 'All options for the command wrapper must be provided as a hash. '\
        "You entered: #{options.inspect}. Please consult the documentation."
    end

    wrap = options[:wrap]
    raise "Called command wrapper with wrap: #{wrap.inspect}. It must be called with a Proc." if !wrap.nil? && !wrap.is_a?(Proc)
    return wrap.call(cmd) unless wrap.nil?

    shell = options[:shell]
    raise "Don't know how to wrap commands for shell: #{shell.inspect}." unless UNIX_SHELLS.include?(shell)

    path = options[:path] || shell
    args = options[:args] || '-c'
    path.to_s + ' ' + args + ' ' + Shellwords.escape(cmd)
  end
end
