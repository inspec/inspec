require 'helper'
require 'inspec/utils/parser'

describe PasswdParser do
  let (:parser) { Class.new() { include PasswdParser }.new }

  describe '#parse_passwd' do
    it 'parses nil content' do
      parser.parse_passwd(nil).must_equal([])
    end

    it 'parses an empty passwd line' do
      parser.parse_passwd('').must_equal([])
    end

    it 'parses a comment line' do
      content = <<EOF
# This is a comment
# this is another comment
root:x:0:0:root:/root:/bin/sh
EOF
      info = [{ "user"=>"root",
                "password"=>"x",
                "uid"=>"0",
                "gid"=>"0",
                "desc"=>"root",
                "home"=>"/root",
                "shell"=>"/bin/sh" }]
      parser.parse_passwd(content).must_equal(info)
    end

    it 'parses a valid passwd line' do
      info = [{
        "user"=>"root",
        "password"=>"x",
        "uid"=>"0",
        "gid"=>"0",
        "desc"=>"root",
        "home"=>"/root",
        "shell"=>"/bin/sh"
      }]
      parser.parse_passwd('root:x:0:0:root:/root:/bin/sh').must_equal(info)
    end
  end
end
