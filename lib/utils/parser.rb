# encoding: utf-8

module ContentParser
  # parse etc/passwd file
  def parse_passwd(content)
    content.split("\n").map do |line|
      parse_passwd_line(line)
    end
  end

  # parse a etc/passwd line
  def parse_passwd_line(line)
    x = line.split(':')
    {
      'name' => x.at(0),
      'password' => x.at(1),
      'uid' => x.at(2),
      'gid' => x.at(3),
      'desc' => x.at(4),
      'home' => x.at(5),
      'shell' => x.at(6),
    }
  end
end
