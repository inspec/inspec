module InspecPlugins
  module MeaningOfLife

    class Plugin < Inspec.plugin(2)
      plugin_name :'inspec-meaning-of-life'

      mock_plugin_type 'meaning-of-life-the-universe-and-everything' do
        # NOTE: we can't use require, because these test files are repeatedly reloaded
        load 'test/unit/mock/plugins/meaning_of_life_path_mode/inspec-meaning-of-life/mock_plugin.rb'
        InspecPlugins::MeaningOfLife::MockPlugin
      end
    end

  end
end