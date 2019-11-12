class FavoriteBerry < Inspec.resource(1)
  name 'favorite_berry'
  desc 'Will it blend?'
  example <<~EOE
  describe favorite_berry('mulberry') do
    it { should blend }
    it { should have_drupes }
  end

  describe favorite_berry('raspberry pi 3') do
    # Oh it will, regardless.
    it { should_not blend }
  end
  EOE

  # This will install the instance method have_drupes?
  food_type :berries

  attr_reader :berry_name

  def initialize(berry_name)
    @berry_name = berry_name
  end

  def blendable?
    true
  end
end