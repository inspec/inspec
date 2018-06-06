# encoding: utf-8
# author: David Alexander <opensource@thelonelyghost.com>

class PInvokeWrapper
  # A wrapper for use with PowerShell's P/Invoke capability
  #
  # @param script_name : A filename given for something that will be read into a string
  # @param type : The type of P/Invoke syntax to use. Most common is for C# (:csharp)
  # @return : The string value of the script wrapped in the appropriate P/Invoke syntax
  def self.wrap(script_name, type = :csharp)
    script_path = ::File.join(::File.dirname(__FILE__), 'pinvoke', script_name)
    contents = ::File.read(script_path)
    case type
    when :csharp
      return <<~EOH
        $script = @'\n#{contents}'@
        Add-Type -TypeDefinition $script
      EOH
    else
      raise "Unsupported type #{type.inspect} for using with P/Invoke"
    end
  end
end
