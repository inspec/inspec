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
#
# Usage:
#
# describe audit_policy do
#   its('Other Account Logon Events') { should_not eq 'No Auditing' }
# end

class AuditPolicy < Vulcano.resource(1)
  name 'audit_policy'

  def method_missing(method)
    key = method.to_s

    # expected result:
    # Machine Name,Policy Target,Subcategory,Subcategory GUID,Inclusion Setting,Exclusion Setting
    # WIN-MB8NINQ388J,System,Kerberos Authentication Service,{0CCE9242-69AE-11D9-BED3-505054503030},No Auditing,
    result ||= vulcano.command("Auditpol /get /subcategory:'#{key}' /r").stdout

    # find line
    target = nil
    result.each_line {|s|
      target = s.strip if s.match(/\b.*#{key}.*\b/)
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
