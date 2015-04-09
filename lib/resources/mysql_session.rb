# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved

class MysqlSession
  def initialize user, pass
    @user = user
    @pass = pass
  end

  def describe(query, db = "", &block)
    # TODO: simple escape, must be handled by a library
    # that does this securely
    escaped_query = query.gsub(/\\/, '\\\\').gsub(/"/,'\\"').gsub(/\$/,'\\$')
    # run the query
    cmd = Serverspec::Type::Command.new("mysql -u#{@user} -p#{@pass} #{db} -s -e \"#{escaped_query}\"")
    out = cmd.stdout + "\n" + cmd.stderr
    if out =~ /Can't connect to .* MySQL server/ or
       out.downcase =~ /^error/
      # skip this test if the server can't run the query
      RSpec.describe( cmd ) do
        it "is skipped", skip: out do
        end
      end
    else
      RSpec.__send__( 'describe', cmd, &block )
    end
  end

end

def start_mysql_session( user, password )
  MysqlSession.new(user, password)
end

