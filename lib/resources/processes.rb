# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Dominik Richter
# author: Christoph Hartmann
# license: All rights reserved

class Processes < Inspec.resource(1)
  name 'processes'
  desc 'Use the processes InSpec audit resource to test properties for programs that are running on the system.'
  example "
    describe processes('mysqld') do
      its('list.length') { should eq 1 }
      its('users') { should eq ['mysql'] }
      its('states') { should include 'S' }
    end
  "

  attr_reader :list,
              :users,
              :states

  def initialize(grep)
    # turn into a regexp if it isn't one yet
    if grep.class == String
      grep = '(/[^/]*)*'+grep if grep[0] != '/'
      grep = Regexp.new('^' + grep + '(\s|$)')
    end

    all_cmds = ps_aux
    @list = all_cmds.find_all do |hm|
      hm[:command] =~ grep
    end

    { users: :user,
      states: :stat }.each do |var, key|
      instance_variable_set("@#{var}", @list.map { |l| l[key] }.uniq)
    end
  end

  def to_s
    'Processes'
  end

  private

  def ps_aux
    # get all running processes
    cmd = inspec.command('ps aux')
    all = cmd.stdout.split("\n")[1..-1]
    return [] if all.nil?

    lines = all.map do |line|
      # user   32296  0.0  0.0  42592  7972 pts/15   Ss+  Apr06   0:00 zsh
      line.match(/^([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+([^ ]+)\s+(.*)$/)
    end.compact

    lines.map do |m|
      {
        user: m[1],
        pid: m[2],
        cpu: m[3],
        mem: m[4],
        vsz: m[5],
        rss: m[6],
        tty: m[7],
        stat: m[8],
        start: m[9],
        time: m[10],
        command: m[11],
      }
    end
  end
end
