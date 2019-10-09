class Example < Inspec.resource(1)
  name "example"
  example "
    describe example do
      its('crime_rate') { should be < 2 }
      it { should have_a_fabulous_mustache }
    end
  "

  def crime_rate
    1
  end

  def has_a_fabulous_mustache?
    true
  end
end
