# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Dominik Richter
# author: Christoph Hartmann
# license: All rights reserved

class Processes < Vulcano.resource(1)
  name 'processes'

  attr_reader :list
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
  end

  def to_s
    'Processes'
  end

  private

  def ps_aux
    # get all running processes
    cmd = vulcano.command('ps aux')
    all = cmd.stdout.split("\n")[1..-1]

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
