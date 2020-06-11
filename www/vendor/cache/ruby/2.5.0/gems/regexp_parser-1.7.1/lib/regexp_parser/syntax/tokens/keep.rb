module Regexp::Syntax
  module Token
    module Keep
      Mark = [:mark]

      All  = Mark
      Type = :keep
    end

    Map[Keep::Type] = Keep::All
  end
end
