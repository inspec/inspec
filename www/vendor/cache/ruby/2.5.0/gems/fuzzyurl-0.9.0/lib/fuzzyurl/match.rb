require 'fuzzyurl/protocols'

class Fuzzyurl::Match
  class << self

    # If `mask` (which may contain * wildcards) matches `url` (which may not),
    # returns an integer representing how closely they match (higher is closer).
    # If `mask` does not match `url`, returns null.
    #
    # @param mask [Fuzzyurl] Fuzzyurl mask to match with
    # @param url [Fuzzyurl] Fuzzyurl URL to match
    # @returns [Fuzzyurl] Fuzzyurl-like object containing match scores
    def match(mask, url)
      scores = match_scores(mask, url)
      return nil if scores.values.include?(nil)
      scores.values.reduce(:+)
    end


    # If `mask` (which may contain * wildcards) matches `url` (which may not),
    # returns true; otherwise returns false.
    #
    # @param mask [Fuzzyurl] Fuzzyurl mask to match with
    # @param url [Fuzzyurl] Fuzzyurl URL to match
    # @returns [Fuzzyurl] Fuzzyurl-like object containing match scores
    def matches?(mask, url)
      match(mask, url) != nil
    end


    # Returns a Fuzzyurl-like object containing values representing how well
    # different parts of `mask` and `url` match.  Values are integers for
    # matches or null for no match; higher integers indicate a better match.
    #
    # @param mask [Fuzzyurl] Fuzzyurl mask to match with
    # @param url [Fuzzyurl] Fuzzyurl URL to match
    # @returns [Hash] Hash containing match scores for each field
    def match_scores(mask, url)
      url_protocol = url.protocol || Fuzzyurl::Protocols.get_protocol(url.port)
      url_port = url.port || Fuzzyurl::Protocols.get_port(url.protocol)
      {
        protocol: fuzzy_match(mask.protocol, url_protocol),
        username: fuzzy_match(mask.username, url.username),
        password: fuzzy_match(mask.password, url.password),
        hostname: fuzzy_match(mask.hostname, url.hostname),
        port: fuzzy_match(mask.port, url_port),
        path: fuzzy_match(mask.path, url.path),
        query: fuzzy_match(mask.query, url.query),
        fragment: fuzzy_match(mask.fragment, url.fragment)
      }
    end


    # From a list of Fuzzyurl `masks`, returns the index of the one which best
    # matches `url`.  Returns null if none of `masks` match.
    #
    # @param [Array] Array of Fuzzyurl URL mask objects to match with.
    # @param [Fuzzyurl] Fuzzyurl URL to match.
    # @returns [Integer|nil] Index of best matching mask, or null if none match.
    def best_match_index(masks, url)
      best_index = nil
      best_score = -1
      masks.each_with_index do |mask, i|
        score = match(mask, url)
        if score && score > best_score
          best_score = score
          best_index = i
        end
      end
      best_index
    end


    # If `mask` (which may contain * wildcards) matches `url` (which may not),
    # returns 1 if `mask` and `url` match perfectly, 0 if `mask` and `url`
    # are a wildcard match, or null otherwise.
    #
    # Wildcard language:
    #
    #     *              matches anything
    #     foo/*          matches "foo/" and "foo/bar/baz" but not "foo"
    #     foo/**         matches "foo/" and "foo/bar/baz" and "foo"
    #     *.example.com  matches "api.v1.example.com" but not "example.com"
    #     **.example.com matches "api.v1.example.com" and "example.com"
    #
    # Any other form is treated as a literal match.
    #
    # @param mask [String] String mask to match with (may contain wildcards).
    # @param value [String] String value to match.
    # @returns [Integer|nil] 0 for wildcard match, 1 for perfect match, else nil.
    def fuzzy_match(mask, value)
      return 0 if mask == "*"
      return 1 if mask == value
      return nil if !mask || !value

      if mask.index("**.") == 0
        mask_value = mask[3..-1]
        return 0 if value.end_with?(".#{mask_value}")
        return 0 if mask_value == value
        return nil
      end
      if mask.index("*") == 0
        return 0 if value.end_with?(mask[1..-1])
        return nil
      end

      rev_mask = mask.reverse
      rev_value = value.reverse

      if rev_mask.index("**/") == 0
        rev_mask_value = rev_mask[3..-1]
        return 0 if rev_value.end_with?("/#{rev_mask_value}")
        return 0 if rev_mask_value == rev_value
        return nil
      end

      if rev_mask.index("*") == 0
        return 0 if rev_value.end_with?(rev_mask[1..-1])
        return nil
      end

      nil
    end

  end
end

