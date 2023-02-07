require "money"

class MoneyConverter < Inspec.resource(1)
  name "money_converter"

  supports platform: "unix"
  supports platform: "windows"

  desc "money_converter"
    example <<~EXAMPLE
      describe money_converter.cents do
        it { should eq 1000 }
      end
    EXAMPLE

    def initialize
      # select permissions style
      Money.locale_backend = nil
      Money.default_currency = "USD"
      Money.rounding_mode = BigDecimal::ROUND_HALF_UP
    end

    def cents
      m = Money.from_cents(1000, "USD")
      m.cents
    end

    def to_s
      "MoneyConverter"
    end
end