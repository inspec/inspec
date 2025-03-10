require "inspec/utils/ai"
module InspecPlugins::AI
  class Cli < Inspec.plugin(2, :cli_command)

    subcommand_desc "ai SUBCOMMAND [options]", "InSpec AI"

    desc "assistant", "InSpec AI for help"
    def assistant
      Inspec::AI.start
    end

    desc "summarise", "InSpec AI helping in providing summarisation to control results"
    def summarise
      Inspec::AI.display_warning
      Inspec::AI.summarise_control
    end

    desc "remediate", "InSpec AI helping in providing remeditation suggestion on control results"
    def remediate
      Inspec::AI.display_warning
      Inspec::AI.remediation_suggestions
    end
  end
end
