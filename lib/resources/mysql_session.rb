# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Dominik Richter
# author: Christoph Hartmann
# license: All rights reserved

class MysqlSession < Vulcano.resource(1)
  name 'mysql_session'

  def initialize(user, pass)
    @user = user
    @pass = pass
    init_fallback if user.nil? or pass.nil?
    skip_resource("Can't run MySQL SQL checks without authentication") if @user.nil? or @pass.nil?
  end

  def query(q, db = '')
    # TODO: simple escape, must be handled by a library
    # that does this securely
    escaped_query = q.gsub(/\\/, '\\\\').gsub(/"/, '\\"').gsub(/\$/, '\\$')

    # run the query
    cmd = vulcano.command("mysql -u#{@user} -p#{@pass} #{db} -s -e \"#{escaped_query}\"")
    out = cmd.stdout + "\n" + cmd.stderr
    if out =~ /Can't connect to .* MySQL server/ or
       out.downcase =~ /^error/
      # skip this test if the server can't run the query
      skip_resource("Can't connect to MySQL instance for SQL checks.")
    end

    # return the raw command output
    cmd
  end

  def to_s
    'MySQL Session'
  end

  private

  def init_fallback
    # support debian mysql administration login
    debian = vulcano.command('test -f /etc/mysql/debian.cnf && cat /etc/mysql/debian.cnf').stdout
    return if debian.empty?

    user = debian.match(/^\s*user\s*=\s*([^ ]*)\s*$/)
    pass = debian.match(/^\s*password\s*=\s*([^ ]*)\s*$/)
    return if user.nil? or pass.nil?
    @user = user[1]
    @pass = pass[1]
  end
end
