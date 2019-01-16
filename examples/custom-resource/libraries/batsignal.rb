class Batsignal < Inspec.resource(1)
  name "batsignal"

  example "
      describe batsignal do
        its('number_of_sightings)') { should eq '4' }
      end
  "

  def number_of_sightings
    local_command_call
  end

  private

  def local_command_call
    # call out to a core resource
    inspec.command("echo 4").stdout.to_i
  end
end
