# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

# The file format consists of
# - username
# - password
# - userid
# - groupid
# - user id info
# - home directory
# - command

module Serverspec
  module Type

    class Passwd < File

      attr_accessor :uid

      def to_s
        %Q[/etc/passwd]
      end

      def determine_uid ()
        parsed = parse()
        uids = Array.new
        parsed.each {|x| 
          if ( x.at(2) == "#{@uid}") then
            uids.push(x.at(0))
          end
        }
        uids
      end

      def username
        uids = determine_uid()
        uids.at(0)
      end

      def count
        arr = determine_uid()
        arr.length
      end

      def map_data (id)
        parsed = parse()
        parsed.map {|x|
          x.at(id)
        }
      end

      def usernames
        map_data(0)
      end

      def passwords
        map_data(1)
      end

      def uids
        map_data(2)
      end

      def gids
        map_data(3)
      end

      def users
        parsed = parse()
        parsed.map {|x|
          {
            "name" => x.at(0),
            "password" => x.at(1),
            "uid" => x.at(2),
            "gid" => x.at(3),
            "desc" => x.at(4),
            "home" => x.at(5),
            "shell" => x.at(6)
          }
        }
      end

      def parse
        entries = Array.new
        content().split("\n").each do |line|
          entries.push(line.split(':'))
        end
        entries
      end

    end

    def passwd(uid=nil)
      i = Passwd.new('/etc/passwd')
      i.uid = uid
      i
    end

  end
end

include Serverspec::Type