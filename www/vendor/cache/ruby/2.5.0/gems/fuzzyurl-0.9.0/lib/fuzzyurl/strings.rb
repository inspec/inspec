require 'fuzzyurl/fields'

class Fuzzyurl::Strings
  REGEX = %r{
    ^
    (?: (?<protocol> \* | [a-zA-Z][A-Za-z+.-]+) ://)?
    (?: (?<username> \* | [a-zA-Z0-9%_.!~*'();&=+$,-]+)
        (?: : (?<password> \* | [a-zA-Z0-9%_.!~*'();&=+$,-]*))?
        @
    )?
    (?<hostname> [a-zA-Z0-9\.\*\-_]+?)?
    (?: : (?<port> \* | \d+))?
    (?<path> / [^\?\#]*)?                 ## captures leading /
    (?: \? (?<query> [^\#]*) )?
    (?: \# (?<fragment> .*) )?
    $
  }x

  class << self

    def from_string(str, opts={})
      return nil unless str.kind_of?(String)

      default = opts[:default]
      if m = REGEX.match(str)
        fu = Fuzzyurl.new
        Fuzzyurl::FIELDS.each do |f|
          fu.send("#{f}=", m[f] || default)
        end
        fu
      else
        raise ArgumentError, "Couldn't parse url string: #{str}"
      end
    end

    def to_string(fuzzyurl)
      if !fuzzyurl.kind_of?(Fuzzyurl)
        raise ArgumentError, "`fuzzyurl` must be a Fuzzyurl"
      end

      fu = fuzzyurl
      str = ""
      str << "#{fu.protocol}://" if fu.protocol
      str << "#{fu.username}" if fu.username
      str << ":#{fu.password}" if fu.password
      str << "@" if fu.username
      str << "#{fu.hostname}" if fu.hostname
      str << ":#{fu.port}" if fu.port
      str << "#{fu.path}" if fu.path
      str << "?#{fu.query}" if fu.query
      str << "##{fu.fragment}" if fu.fragment
      str
    end

  end
end
