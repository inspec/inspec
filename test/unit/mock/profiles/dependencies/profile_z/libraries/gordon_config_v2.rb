class GordonConfigv2 < JsonConfig
  name 'gordon_configv2'

  desc "Gordonv2's resource description ..."

  example "
    describe gordon_configv2 do
      its('version') { should eq('2.0') }
    end
  "

  def initialize
    super('/tmp/gordon.json')
  end

  def version
    "2.0"
  end
end
