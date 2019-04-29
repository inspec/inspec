require 'helper'
require 'inspec/resource'
require 'inspec/resources/pam'

describe 'Inspec::Resources::Pam' do
  let(:pam_fixture_path) {
    File.absolute_path(
      File.join(
        'test', 'unit', 'resource_supports', 'pam', 'pam.d'
      )
    )
  }

  let(:resource) { load_resource('pam', pam_fixture_path) }
  let(:inspec) { mock('inspec-backend') }

  before(:each) do
    # Alias 'content' since the code expects that from a File resource
    class Pathname
      def content
        read
      end
    end

    pam_target = "#{pam_fixture_path}/*"

    resource.expects(:get_file).with(pam_fixture_path).returns(Pathname.new(pam_fixture_path))
    resource.expects(:list_files).with("#{pam_target}/*").returns(Dir[pam_target])
  end

  it 'prints the target path' do
    resource.to_s.must_equal "PAM Config[#{pam_fixture_path}]"
  end

  it 'has the content of the fixture files' do
    require 'pry'
    binding.pry
    puts 'foo'
  end
end
