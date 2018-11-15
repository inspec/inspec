# encoding: utf-8

module InspecPlugins::TestUI
  class CliCommand < Inspec.plugin(2, :cli_command)
    subcommand_desc 'testui [FEATURE] [OPTS]', 'Exercise Inspec::UI'

    desc 'headline', 'Inspec::UI#headline'
    def headline
      ui.headline('Big News!')
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

    desc 'warning', 'Inspec::UI#warning'
    def warning
      ui.warning('Things will be OK in the end')
    end

    desc 'error', 'Inspec::UI#error'
    def error
      ui.error('Burned down, fell over, and then sank into the swamp.')
    end

    desc 'list_item', 'Inspec::UI#list_item'
    def list_item
      ui.list_item('TODO: make more lists')
    end

    desc 'everything', 'Demo all UI features'
    def everything
      headline
      table
      warning
      error
      list_item
    end

  end
end
