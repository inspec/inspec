require 'json'

# Registry Key Helper
module Serverspec
  module Type

    class RegistryKey < Base

      attr_accessor :reg_key

      def getRegistryValue(path, key)
        cmd = "(Get-Item 'Registry::#{path}').GetValue('#{key}')"
        command_result ||= @runner.run_command(cmd)
        val = { :exit_code => command_result.exit_status.to_i, :data => command_result.stdout }
        val
      end

      def convertValue (value)
        val = value.strip
        val = val.to_i if val.match(/^\d+$/)
      end

      # returns nil, if not existant or value
      def method_missing(meth)

        # get data
        val = getRegistryValue(@reg_key, meth)

        # verify data
        if (val[:exit_code] == 0)
          val = convertValue(val[:data])
        else
          nil
        end

      end

      def to_s
        "Registry Key #{@name}"
      end

    end

    def registry_key(name, reg_key=nil)

      # if we have one parameter, we use it as name
      if reg_key == nil
        reg_key = name
      end

      # initialize variable
      i = RegistryKey.new(name)
      i.reg_key = reg_key
      i
    end

  end
end

include Serverspec::Type
