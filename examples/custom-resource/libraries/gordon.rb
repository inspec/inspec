class Gordon < Inspec.resource(1)
  name "gordon"

  example "
    describe gordon do
      its('crime_rate') { should be < 2 }
      it { should have_a_fabulous_mustache }
    end
  "

  def crime_rate
    # call out ot another custom resource
    inspec.batsignal.number_of_sightings
  end

  def has_a_fabulous_mustache?
    # always true
    true
  end
end
