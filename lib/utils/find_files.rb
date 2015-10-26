# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved
# author: Dominik Richter
# author: Christoph Hartmann

module FindFiles
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

  def find_files(path, opts = {})
    depth = opts[:depth]
    type = TYPES[opts[:type].to_sym]

    cmd = "find #{path}"
    cmd += " -maxdepth #{depth.to_i}" if depth.to_i > 0
    cmd += " -type #{type}" unless type.nil?

    result = inspec.run_command(cmd)
    exit_status = result.exit_status

    return [nil, exit_status] unless exit_status == 0
    files = result.stdout.split("\n")
            .map(&:strip)
            .find_all { |x| !x.empty? }
    [files, exit_status]
  end
end
