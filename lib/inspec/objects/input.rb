# This file is deprecated and will be removed in the next major release of InSpec.
# The Inspec::Input class will remain but these methods will be removed.
# Use the Inspec::Object::Input class from the inspec-objects rubygem instead.

require "inspec/input"

module Inspec

  # NOTE: due to namespacing, this reopens and extends the existing
  # Inspec::Input. This should be under Inspec::Objects but that ship
  # has sailed.

  class Input

    # NOTE: No initialize method or accessors for the reasons listed above

    #--------------------------------------------------------------------------#
    #                               Marshalling
    #--------------------------------------------------------------------------#

    def to_hash
      as_hash = { name: name, options: {} }
      %i{description title identifier type required value pattern}.each do |field|
        val = send(field)
        next if val.nil?

        as_hash[:options][field] = val
      end
      as_hash
    end

    def ruby_var_identifier
      identifier || "attr_" + name.downcase.strip.gsub(/\s+/, "-").gsub(/[^\w-]/, "")
    end

    def to_ruby
      res = ["#{ruby_var_identifier} = attribute('#{name}',{"]
      res.push "  title: '#{title}'," unless title.to_s.empty?
      res.push "  value: #{value.inspect}," unless value.to_s.empty?
      # to_ruby may generate code that is to be used by older versions of inspec.
      # Anything older than 3.4 will not recognize the value: option, so
      # send the default: option as well. See #3759
      res.push "  default: #{value.inspect}," unless value.to_s.empty?
      res.push "  description: '#{description}'," unless description.to_s.empty?
      res.push "})"
      res.join("\n")
    end
  end
end
