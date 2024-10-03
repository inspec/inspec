require "inspec/utils/ai.rb"
module InspecPlugins::AI
  class Cli < Inspec.plugin(2, :cli_command)
    
    subcommand_desc "ai SUBCOMMAND [options]", "InSpec AI"

    desc "assistant", "InSpec AI for help"
    def assistant
      Inspec::AI.start
    end

    desc "summarise", "InSpec AI helping in providing summarisation to control results"
    def summarise
      Inspec::AI.summarise_control
    end

    desc "remediation", "InSpec AI helping in providing remeditation suggetion on control results"
    def remediation
      # Implement control remediation help
    end
  end
end
