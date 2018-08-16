module InspecPlugins
  module MeaningOfLife

    class Plugin < Inspec.plugin(2)
      plugin_name :meaning_of_life
      # cli 'meaning-of-life-the-universe-and-everything' do
      #   require_relative './cli'
      #   InspecPlugins::MeaningOfLife::Cli
      # end
    end

  end
end