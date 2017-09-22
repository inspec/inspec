# encoding: utf-8
# author: Matt Ray

module Inspec::Resources
  class Hotfix < Inspec.resource(1)
    name 'hotfix'
    desc 'Use the hotfix InSpec audit resource to test if the hotfix has been installed on the Windows system.'
    example "
      describe hotfix('KB4012212') do
        it { should be_installed }
      end
    "

    attr_accessor :content

    def initialize(hotfix_id = nil)
      @id = hotfix_id.upcase
      @content = nil
      os = inspec.os
      return skip_resource 'The `hotfix` resource is not a feature of your OS.' unless os.windows?
      query = "Get-WmiObject -class \"win32_quickfixengineering\" -filter \"HotFixID = '" + @id + "'\""
      cmd = inspec.powershell(query)
      @content = cmd.stdout
    end

    def to_s
      "Hotfix #{@id}"
    end

    def installed?
      return false if @content.nil?
      @content.include?(@id)
    end
  end
end
