require "money"

control "tmp-1.0" do
  Money.rounding_mode = BigDecimal::ROUND_HALF_UP
  m = Money.from_cents(1000, "USD")
  cents = m.cents

  describe cents do
    it { should eq 1000 }
  end
end
