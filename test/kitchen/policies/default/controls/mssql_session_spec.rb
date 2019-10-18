# the following test will query the MSSQL database for the Server Property of IsIntegratedSecurityOnly which should be
# 0 which means that it is using both Windows Authentication and SQL Server Authentication.
# @see https://docs.microsoft.com/en-us/sql/t-sql/functions/serverproperty-transact-sql
if os.windows?
  sql_windows_auth = mssql_session(user: 'sa', pass: 'Password12!', instance: 'SQL2012SP1')
  describe sql_windows_auth.query("SELECT SERVERPROPERTY('IsIntegratedSecurityOnly') as \\\"login_mode\\\";").row(0).column('login_mode') do
    its('value') { should_not be_empty }
    its('value') { should cmp == 1 }
  end
end
