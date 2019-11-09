module InspecPlugins
  module DslTest
    module DescribeDslFavoriteVegetable
      def favorite_vegetable(veggie)
        # Inspec ignores example groups.  It only cares about examples.
        # So, to have a visible effect in the reporter output, alter the examples.
        examples.each do |example|
          example.metadata[:full_description] += veggie
        end
      end
    end
  end
end
