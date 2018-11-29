module InspecPlugins
  module DslTest
    module TestDslFavoriteLegume
      def favorite_legume(legume)
        # This is an absurd thing to do, but we're just seeking a way to show that the
        # plugin ran, in a way we can detect from the JSON reporter
        # I just couldn't find a way to get to the metadata in a way that stuck; so this will do for testing.
        raise "My favorite legume is #{legume}"
      end
    end
  end
end
