class Gordon < Inspec.resource(1)
  name 'gordon'

  example "
    describe gordon do
      its('example') { should eq 'foobar' }
    end
  "

  def example
    # call out ot another custom resource
    inspec.foobar.info
  end
end

