module InspecPlugins
  module DslTest
    module OuterProfileDslFavoriteGrain
      def favorite_grain(grain)
        # Inject a new control
        control(grain) do
          describe(grain) do
            it { should eq grain }
          end
        end
      end
    end
  end
end
