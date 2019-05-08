# copyright: 2015, Vulcano Security GmbH
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
  }.freeze

  # ignores errors
  def find_files(path, opts = {})
    find_files_or_warn(path, opts) || []
  end

  def find_files_or_warn(path, opts = {})
    depth = opts[:depth]
    type = TYPES[opts[:type].to_sym] if opts[:type]

    # If `path` contains a `'` we must modify how we quote the `sh -c` argument
    quote = path.include?("'") ? '"' : '\''

    cmd = "sh -c #{quote}find #{path}"
    cmd += " -type #{type}" unless type.nil?
    cmd += " -maxdepth #{depth.to_i}" if depth.to_i > 0
    cmd += quote

    result = inspec.command(cmd)
    exit_status = result.exit_status

    unless exit_status == 0
      warn "find_files(): exit #{exit_status} from `#{cmd}`"
      return nil
    end

    result.stdout.split("\n")
          .map(&:strip)
          .find_all { |x| !x.empty? }
  end
end
