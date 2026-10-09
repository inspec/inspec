# frozen_string_literal: true

require "inspec/utils/file_reader"
require "inspec/utils/filter"
require "inspec/utils/pam_parser"

module Inspec::Resources
  class Pam < Inspec.resource(1)
    name "pam"
    supports platform: "unix"
    desc "Use the pam InSpec audit resource to test Pluggable Authentication Modules (PAM) configuration files."
    example <<~EXAMPLE
      describe pam('/etc/pam.d/system-auth') do
        its('modules') { should include 'pam_unix.so' }
      end

      describe pam('/etc/pam.d/password-auth').where(type: 'auth') do
        its('controls') { should include 'required' }
      end
    EXAMPLE

    include FileReader

    attr_reader :params, :path

    def initialize(path)
      @path = path
      @content = read_file_content(@path, true)
      @params = Inspec::Utils::PamParser.parse(@content)
    end

    filter = FilterTable.create
    filter.register_column(:types, field: "type")
          .register_column(:missing_oks, field: "missing_ok")
          .register_column(:controls, field: "control")
          .register_column(:modules, field: "module_path")
          .register_column(:module_args, field: "module_args")

    filter.install_filter_methods_on_resource(self, :params)

    def to_s
      "PAM Configuration #{@path}"
    end
  end
end
