# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

module Compliance
  # is a helper that provides information which version of compliance supports
  # which feature
  class Support
    # for a feature, returns either:
    #  - a version v0:                      v supports v0       iff v0 <= v
    #  - an array [v0, v1] of two versions: v supports [v0, v1] iff v0 <= v < v1
    def self.version_with_support(feature)
      case feature.to_sym
      when :oidc # open id connect authentication
        Gem::Version.new('0.16.19')
      else
        Gem::Version.new('0.0.0')
      end
    end

    # determines if the given version support a certain feature
    def self.supported?(feature, version)
      sup = version_with_support(feature)

      if sup.is_a?(Array)
        Gem::Version.new(version) >= sup[0] &&
          Gem::Version.new(version) < sup[1]
      else
        Gem::Version.new(version) >= sup
      end
    end

    # we do not know the version, therefore we do not know if its possible to use the feature
    # return if self['version'].nil? || self['version']['version'].nil?
  end
end
