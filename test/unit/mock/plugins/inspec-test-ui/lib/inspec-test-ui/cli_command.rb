# encoding: utf-8

module InspecPlugins::TestUI
  class CliCommand < Inspec.plugin(2, :cli_command)
    subcommand_desc 'testui [FEATURE] [OPTS]', 'Exercise Inspec::UI'

    desc 'headline', 'Inspec::UI#headline'
    def headline
      ui.headline('test')
    end

    desc 'table', 'Inspec::UI#table'
    def table
      ui.table do |t|
        t.header = ['Band', 'Coolness', 'Nerd Cred']
        t << ['They Might Be Giants', 'Low', 'Very High']
        t << ['Led Zep', 'High', 'Low']
        t << ['Talking Heads', 'Moderate', 'High']
      end
    end
  end
end
