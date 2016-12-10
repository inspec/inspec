class GordonConfig < JsonConfig
  name 'gordon_config'

  desc "Gordon's resource description ..."

  example "
    describe gordon_config do
      its('version') { should eq('1.0') }
    end
  "

  def initialize
    super('/tmp/gordon.json')
  end

  def version
    "1.0"
  end
end
