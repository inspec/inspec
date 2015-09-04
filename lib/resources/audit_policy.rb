# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

## Advanced Auditing
# As soon as you start applying Advanced Audit Configuration Policy, legacy policies will be completely ignored.
# reference: https://technet.microsoft.com/en-us/library/cc753632.aspx
# use:
#  - list all categories: Auditpol /list /subcategory:* /r
#  - list parameters: Auditpol /get /category:"System" /subcategory:"IPsec Driver"
#  - list specific parameter: Auditpol /get /subcategory:"IPsec Driver"
#
# @link: http://blogs.technet.com/b/askds/archive/2011/03/11/getting-the-effective-audit-policy-in-windows-7-and-2008-r2.aspx

=begin
Category/Subcategory,GUID
System,{69979848-797A-11D9-BED3-505054503030}
  Security State Change,{0CCE9210-69AE-11D9-BED3-505054503030}
  Security System Extension,{0CCE9211-69AE-11D9-BED3-505054503030}
  System Integrity,{0CCE9212-69AE-11D9-BED3-505054503030}
  IPsec Driver,{0CCE9213-69AE-11D9-BED3-505054503030}
  Other System Events,{0CCE9214-69AE-11D9-BED3-505054503030}
Logon/Logoff,{69979849-797A-11D9-BED3-505054503030}
  Logon,{0CCE9215-69AE-11D9-BED3-505054503030}
  Logoff,{0CCE9216-69AE-11D9-BED3-505054503030}
  Account Lockout,{0CCE9217-69AE-11D9-BED3-505054503030}
  IPsec Main Mode,{0CCE9218-69AE-11D9-BED3-505054503030}
  IPsec Quick Mode,{0CCE9219-69AE-11D9-BED3-505054503030}
  IPsec Extended Mode,{0CCE921A-69AE-11D9-BED3-505054503030}
  Special Logon,{0CCE921B-69AE-11D9-BED3-505054503030}
  Other Logon/Logoff Events,{0CCE921C-69AE-11D9-BED3-505054503030}
  Network Policy Server,{0CCE9243-69AE-11D9-BED3-505054503030}
  User / Device Claims,{0CCE9247-69AE-11D9-BED3-505054503030}
Object Access,{6997984A-797A-11D9-BED3-505054503030}
  File System,{0CCE921D-69AE-11D9-BED3-505054503030}
  Registry,{0CCE921E-69AE-11D9-BED3-505054503030}
  Kernel Object,{0CCE921F-69AE-11D9-BED3-505054503030}
  SAM,{0CCE9220-69AE-11D9-BED3-505054503030}
  Certification Services,{0CCE9221-69AE-11D9-BED3-505054503030}
  Application Generated,{0CCE9222-69AE-11D9-BED3-505054503030}
  Handle Manipulation,{0CCE9223-69AE-11D9-BED3-505054503030}
  File Share,{0CCE9224-69AE-11D9-BED3-505054503030}
  Filtering Platform Packet Drop,{0CCE9225-69AE-11D9-BED3-505054503030}
  Filtering Platform Connection,{0CCE9226-69AE-11D9-BED3-505054503030}
  Other Object Access Events,{0CCE9227-69AE-11D9-BED3-505054503030}
  Detailed File Share,{0CCE9244-69AE-11D9-BED3-505054503030}
  Removable Storage,{0CCE9245-69AE-11D9-BED3-505054503030}
  Central Policy Staging,{0CCE9246-69AE-11D9-BED3-505054503030}
Privilege Use,{6997984B-797A-11D9-BED3-505054503030}
  Sensitive Privilege Use,{0CCE9228-69AE-11D9-BED3-505054503030}
  Non Sensitive Privilege Use,{0CCE9229-69AE-11D9-BED3-505054503030}
  Other Privilege Use Events,{0CCE922A-69AE-11D9-BED3-505054503030}
Detailed Tracking,{6997984C-797A-11D9-BED3-505054503030}
  Process Creation,{0CCE922B-69AE-11D9-BED3-505054503030}
  Process Termination,{0CCE922C-69AE-11D9-BED3-505054503030}
  DPAPI Activity,{0CCE922D-69AE-11D9-BED3-505054503030}
  RPC Events,{0CCE922E-69AE-11D9-BED3-505054503030}
Policy Change,{6997984D-797A-11D9-BED3-505054503030}
  Audit Policy Change,{0CCE922F-69AE-11D9-BED3-505054503030}
  Authentication Policy Change,{0CCE9230-69AE-11D9-BED3-505054503030}
  Authorization Policy Change,{0CCE9231-69AE-11D9-BED3-505054503030}
  MPSSVC Rule-Level Policy Change,{0CCE9232-69AE-11D9-BED3-505054503030}
  Filtering Platform Policy Change,{0CCE9233-69AE-11D9-BED3-505054503030}
  Other Policy Change Events,{0CCE9234-69AE-11D9-BED3-505054503030}
Account Management,{6997984E-797A-11D9-BED3-505054503030}
  User Account Management,{0CCE9235-69AE-11D9-BED3-505054503030}
  Computer Account Management,{0CCE9236-69AE-11D9-BED3-505054503030}
  Security Group Management,{0CCE9237-69AE-11D9-BED3-505054503030}
  Distribution Group Management,{0CCE9238-69AE-11D9-BED3-505054503030}
  Application Group Management,{0CCE9239-69AE-11D9-BED3-505054503030}
  Other Account Management Events,{0CCE923A-69AE-11D9-BED3-505054503030}
DS Access,{6997984F-797A-11D9-BED3-505054503030}
  Directory Service Access,{0CCE923B-69AE-11D9-BED3-505054503030}
  Directory Service Changes,{0CCE923C-69AE-11D9-BED3-505054503030}
  Directory Service Replication,{0CCE923D-69AE-11D9-BED3-505054503030}
  Detailed Directory Service Replication,{0CCE923E-69AE-11D9-BED3-505054503030}
Account Logon,{69979850-797A-11D9-BED3-505054503030}
  Credential Validation,{0CCE923F-69AE-11D9-BED3-505054503030}
  Kerberos Service Ticket Operations,{0CCE9240-69AE-11D9-BED3-505054503030}
  Other Account Logon Events,{0CCE9241-69AE-11D9-BED3-505054503030}
  Kerberos Authentication Service,{0CCE9242-69AE-11D9-BED3-505054503030}

Valid values are:

- "No Auditing"
- "Not Specified"
- "Success"
- "Success and Failure"
- "Failure"

Further information is available at: https://msdn.microsoft.com/en-us/library/dd973859.aspx

=end

class AuditPolicy < Vulcano.resource(1)
  name 'audit_policy'

  def method_missing(method)
    key = method.to_s

    # expected result:
    # Machine Name,Policy Target,Subcategory,Subcategory GUID,Inclusion Setting,Exclusion Setting
    # WIN-MB8NINQ388J,System,Kerberos Authentication Service,{0CCE9242-69AE-11D9-BED3-505054503030},No Auditing,
    result ||= vulcano.run_command("Auditpol /get /subcategory:'#{key}' /r").stdout

    # find line
    target = nil
    result.each_line {|s|
      target = s.strip if s.match(/\b.*#{key}.*\b/)
    }

    # extract value
    if target != nil
      # split csv values and return value
      value = target.split(',')[4]
    else
      value = nil
    end

    value
  end

  def to_s
    'Windows Advanced Auditing'
  end
end
