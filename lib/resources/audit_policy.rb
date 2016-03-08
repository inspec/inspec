# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Christoph Hartmann
# author: Dominik Richter
# license: All rights reserved

# Advanced Auditing:
# As soon as you start applying Advanced Audit Configuration Policy, legacy policies will be completely ignored.
# reference: https://technet.microsoft.com/en-us/library/cc753632.aspx
# use:
#  - list all categories: Auditpol /list /subcategory:* /r
#  - list parameters: Auditpol /get /category:"System" /subcategory:"IPsec Driver"
#  - list specific parameter: Auditpol /get /subcategory:"IPsec Driver"
#
# @link: http://blogs.technet.com/b/askds/archive/2011/03/11/getting-the-effective-audit-policy-in-windows-7-and-2008-r2.aspx
#
# Valid values are:
#
# - "No Auditing"
# - "Not Specified"
# - "Success"
# - "Success and Failure"
# - "Failure"
#
# Further information is available at: https://msdn.microsoft.com/en-us/library/dd973859.aspx

module Inspec::Resources
  class AuditPolicy < Inspec.resource(1)
    name 'audit_policy'
    desc 'Use the audit_policy InSpec audit resource to test auditing policies on the Microsoft Windows platform. An auditing policy is a category of security-related events to be audited. Auditing is disabled by default and may be enabled for categories like account management, logon events, policy changes, process tracking, privilege use, system events, or object access. For each auditing category property that is enabled, the auditing level may be set to No Auditing, Not Specified, Success, Success and Failure, or Failure.'
    example "
      describe audit_policy do
        its('parameter') { should eq 'value' }
      end
    "

    def method_missing(method)
      key = method.to_s

      # expected result:
      # Machine Name,Policy Target,Subcategory,Subcategory GUID,Inclusion Setting,Exclusion Setting
      # WIN-MB8NINQ388J,System,Kerberos Authentication Service,{0CCE9242-69AE-11D9-BED3-505054503030},No Auditing,
      result ||= inspec.command("Auditpol /get /subcategory:'#{key}' /r").stdout

      # find line
      target = nil
      result.each_line {|s|
        target = s.strip if s =~ /\b.*#{key}.*\b/
      }

      # extract value
      values = nil
      unless target.nil?
        # split csv values and return value
        values = target.split(',')[4]
      end

      values
    end

    def to_s
      'Audit Policy'
    end
  end
end
