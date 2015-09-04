# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

class FindFiles

  TYPES = {
    block: 'b',
    character: 'c',
    directory: 'd',
    pipe: 'p',
    file: 'f',
    link: 'l',
    socket: 's',
    door: 'D',
  }

  attr_reader :error, :files
  def initialize(path, opts = {})
    depth = opts[:depth]
    type = TYPES[ opts[:type].to_sym ]

    cmd = "find #{path}"
    cmd += " -maxdepth #{depth.to_i}" if depth.to_i > 0
    cmd += " -type #{type}" unless type.nil?

    @result = Specinfra::Runner.run_command(cmd)
    exit_status = @result.exit_status.to_i
    if exit_status == 0
      @files = @result.stdout.split("\n").map{|x| x.strip}.find_all{|x| !x.empty?}
    else
      @files = []
    end
  end

  def self.find(path, opts = {})
    FindFiles.new(path, opts).files
  end
end
