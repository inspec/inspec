require 'helper'
require 'bundles/inspec-supermarket/api'

def default_url?(supermarket_url)
  supermarket_url == Supermarket::API::SUPERMARKET_URL
end

describe Supermarket::API do
  let(:subject) { Supermarket::API }

  [Supermarket::API::SUPERMARKET_URL, 'https://my.custom.supermarket'].each do |supermarket_url|

    describe "With #{default_url?(supermarket_url) ? 'default' : supermarket_url} Supermarket URL" do

      let(:profile_search_response_body) do
        {
            'start' => 0,
            'total' => 1,
            'items' => [
                {
                    'tool_name' => 'test_name',
                    'tool_type' => 'compliance_profile',
                    'tool_source_url' => supermarket_url,
                    'tool_description' => 'test_description',
                    'tool_owner' => 'test_owner',
                    'tool' => "#{supermarket_url}/api/v1/tools/test_name"
                }
            ]
        }
      end

      let(:profile_name) { 'supermarket://test_owner/test_name' }

      describe '#profiles' do
        it 'returns the profile list' do
          stub_request(:get, "#{supermarket_url}/api/v1/tools-search?items=100&type=compliance_profile").
              to_return(:status => 200, :body => profile_search_response_body.to_json)
          test_profile = default_url?(supermarket_url) ? subject.profiles.first : subject.profiles(supermarket_url).first

          test_profile.must_equal(profile_search_response_body['items'].first.merge({'slug' => 'test_name'}))
        end
      end

      describe '#profile_name' do
        it 'returns the profile name and owner from a supermarket://owner/name path' do
          tool_owner, tool_name = subject.profile_name('supermarket://test_tool_owner/test_tool_name')

          tool_owner.must_equal('test_tool_owner')
          tool_name.must_equal('test_tool_name')
        end
      end

      describe '#info' do
        let(:profile_list_response_body) do
          {
              'name' => 'test_name',
              'slug' => 'test_slug',
              'type' => 'test_type',
              'source_url' => supermarket_url,
              'description' => 'test_description',
              'instructions' => 'test_instructions',
              'owner' => 'test_owner'
          }
        end

        it 'returns profile info' do
          stub_request(:get, "#{supermarket_url}/api/v1/tools/test_name").
              to_return(:status => 200, :body => profile_list_response_body.to_json)

          profile_info = default_url?(supermarket_url) ? subject.info('test_owner/test_name') : subject.info('test_owner/test_name', supermarket_url)

          profile_info.must_equal(profile_list_response_body)
        end
      end

      describe '#same?' do
        let(:tool_url) { "#{supermarket_url}/api/v1/tools/test_name" }

        it 'is the same on a match' do
          supermarket_tool = {'tool_owner' => 'test_owner', 'tool' => tool_url}
          same = default_url?(supermarket_url) ? subject.same?(profile_name, supermarket_tool) : subject.same?(profile_name, supermarket_tool, supermarket_url)
          same.must_equal(true)
        end

        it 'is not the same on a mismatched owner' do
          supermarket_tool = {'tool_owner' => 'wrong_owner', 'tool' => tool_url}
          same = default_url?(supermarket_url) ? subject.same?(profile_name, supermarket_tool) : subject.same?(profile_name, supermarket_tool, supermarket_url)
          same.must_equal(false)
        end

        it 'is not the same on a mismatched supermarket tool' do
          supermarket_tool = {'tool_owner' => 'test_owner', 'tool' => 'garbage'}
          same = default_url?(supermarket_url) ? subject.same?(profile_name, supermarket_tool) : subject.same?(profile_name, supermarket_tool, supermarket_url)
          same.must_equal(false)
        end
      end

      describe '#find' do
        let(:empty_profile_search_response_body) do
          {start: 0, total: 0, items: []}
        end

        it 'returns nil if profiles are empty' do
          stub_request(:get, "#{supermarket_url}/api/v1/tools-search?items=100&type=compliance_profile").
              to_return(:status => 200, :body => empty_profile_search_response_body.to_json)

          search = default_url?(supermarket_url) ? subject.find(profile_name) : subject.find(profile_name, supermarket_url)
          search.must_be_nil
        end

        it 'returns nil if profile not found' do
          stub_request(:get, "#{supermarket_url}/api/v1/tools-search?items=100&type=compliance_profile").
              to_return(:status => 200, :body => profile_search_response_body.to_json)

          profile_name_cant_find = 'supermarket://cant_find/not_found'
          search = default_url?(supermarket_url) ? subject.find(profile_name_cant_find) : subject.find(profile_name_cant_find, supermarket_url)
          search.must_be_nil
        end

        it 'returns profile if it is found' do
          stub_request(:get, "#{supermarket_url}/api/v1/tools-search?items=100&type=compliance_profile").
              to_return(:status => 200, :body => profile_search_response_body.to_json)

          profile = default_url?(supermarket_url) ? subject.find(profile_name) : subject.find(profile_name, supermarket_url)

          profile.must_equal(profile_search_response_body['items'].first.merge({'slug' => 'test_name'}))
        end

        it 'downcases profile name for Supermarket API URL' do
          profile_name = 'supermarket://test_owner/Test_Name'
          stub_request(:get, "#{supermarket_url}/api/v1/tools-search?items=100&type=compliance_profile").
              to_return(:status => 200, :body => profile_search_response_body.to_json)

          profile = if default_url?(supermarket_url)
                      subject.find(profile_name)
                    else
                      subject.find(profile_name, supermarket_url)
                    end

          profile.must_equal(profile_search_response_body['items'].first.merge({'slug' => 'test_name'}))
        end

        it 'raises an error if tool name is not present' do
          profile_name = 'supermarket://owner_only'
          stub_request(:get, "#{supermarket_url}/api/v1/tools-search?items=100&type=compliance_profile").
              to_return(:status => 200, :body => profile_search_response_body.to_json)

          e = proc { subject.find(profile_name, supermarket_url) }.must_raise
          e.message.must_equal("Could not parse tool name from #{profile_name}")
        end
      end
    end
  end
end
