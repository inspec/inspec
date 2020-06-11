class GenericExample
  Contract C::Args[String], { repeat: C::Maybe[C::Num] } => C::ArrayOf[String]
  def splat_then_optional_named(*vals, repeat: 2)
    vals.map { |v| v * repeat }
  end

  Contract ({foo: C::Nat}) => nil
  def nat_test_with_kwarg(foo: 10)
  end
end

RSpec.describe "Contracts:" do
  before :all do
    @o = GenericExample.new
  end

  describe "Optional named arguments" do
    it "should work with optional named argument unfilled after splat" do
      expect { @o.splat_then_optional_named("hello", "world") }.to_not raise_error
    end

    it "should work with optional named argument filled after splat" do
      expect { @o.splat_then_optional_named("hello", "world", repeat: 3) }.to_not raise_error
    end
  end

  describe "Nat:" do
    it "should pass for keyword args with correct arg given" do
      expect { @o.nat_test_with_kwarg(foo: 10) }.to_not raise_error
    end

    it "should fail with a ContractError for wrong keyword args input" do
      expect { @o.nat_test_with_kwarg(foo: -10) }.to raise_error(ContractError)
    end

    it "should fail with a ContractError for no input" do
      expect { @o.nat_test_with_kwarg }.to raise_error(ContractError)
    end
  end
end
