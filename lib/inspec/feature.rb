module Inspec
  def self.with_feature(feature_name, opts = {}, &feature_implementation)
    yield feature_implementation
  end

  class Feature
  end
end
