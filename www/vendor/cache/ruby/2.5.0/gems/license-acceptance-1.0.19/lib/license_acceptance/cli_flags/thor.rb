begin
  require "thor"
rescue => exception
  raise "Must have thor gem installed to use this mixin"
end

module LicenseAcceptance
  module CLIFlags

    module Thor

      def self.included(klass)
        klass.class_option :chef_license,
          type: :string,
          desc: "Accept the license for this product and any contained products: accept, accept-no-persist, accept-silent"
      end

    end

  end
end
