class Foobar < Inspec.resource(1)
  name 'foobar'

  example "
      describe foobar do
        its('info') { should eq 'foobar' }
      end
  "

  def info
    # call out to a core resource
    inspec.command('whoami').stdout
  end
end
