# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

$__SCOPE = self

class MysqlSession < Vulcano.resource(1)
  name 'mysql_session'

  def initialize(user, pass)
    @user = user
    @pass = pass
    initialize_fallback if user.nil? or pass.nil?
    skip_resource("Can't run MySQL SQL checks without authentication") if @user.nil? or @pass.nil?
  end

  def describe(query, db = "", &block)
    # TODO: simple escape, must be handled by a library
    # that does this securely
    escaped_query = query.gsub(/\\/, '\\\\').gsub(/"/,'\\"').gsub(/\$/,'\\$')
    # run the query
    cmd = vulcano.run_command("mysql -u#{@user} -p#{@pass} #{db} -s -e \"#{escaped_query}\"")
    out = cmd.stdout + "\n" + cmd.stderr
    if out =~ /Can't connect to .* MySQL server/ or
       out.downcase =~ /^error/
      # skip this test if the server can't run the query
      skip_resource("Can't connect to MySQL instance for SQL checks.")
    else
      $__SCOPE.describe(cmd, &block)
    end
  end

  private

  def initialize_fallback
    # support debian mysql administration login
    debian = vulcano.run_command("test -f /etc/mysql/debian.cnf && cat /etc/mysql/debian.cnf").stdout
    unless debian.empty?
      user = debian.match(/^\s*user\s*=\s*([^ ]*)\s*$/)
      pass = debian.match(/^\s*password\s*=\s*([^ ]*)\s*$/)
      return if user.nil? or pass.nil?
      @user = user[1]
      @pass = pass[1]
      return
    end
  end
end
