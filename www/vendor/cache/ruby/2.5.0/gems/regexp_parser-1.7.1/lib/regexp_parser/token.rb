class Regexp

  TOKEN_KEYS = [
    :type,
    :token,
    :text,
    :ts,
    :te,
    :level,
    :set_level,
    :conditional_level
  ].freeze

  Token = Struct.new(*TOKEN_KEYS) do
    attr_accessor :previous, :next

    def offset
      [ts, te]
    end

    def length
      te - ts
    end

    if RUBY_VERSION < '2.0.0'
      def to_h
        members.inject({}) do |hash, member|
          hash[member.to_sym] = self[member]
          hash
        end
      end
    end
  end

end
