class GordonConfig < Inspec.resource(1)
  name "gordon_config"

  desc "Gordon's resource description ..."

  example "
    describe gordon_config do
      its('version') { should eq('1.0') }
    end
  "

  def version
    "1.0"
  end
end
