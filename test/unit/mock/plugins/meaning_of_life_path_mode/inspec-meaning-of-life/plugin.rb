module InspecPlugins
  module MeaningOfLife

    class Plugin < Inspec.plugin(2)
      plugin_name :'inspec-meaning-of-life'

      mock_plugin_type 'meaning-of-life-the-universe-and-everything' do
        require_relative './mock_plugin'
        InspecPlugins::MeaningOfLife::MockPLugin
      end
    end

  end
end