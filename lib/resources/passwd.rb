module Serverspec
  module Type

    class Passwd < File

      attr_accessor :uid

      def to_s
        %Q[Passwd]
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

      def uids
        determine_uid()
      end

      def count
        arr = determine_uid()
        arr.length
      end

      def passwords
        parsed = parse()
        parsed.map {|x|
          x.at(1)
        }
      end

      def homedirs
        parsed = parse()
        parsed.map {|x|
          x.at(5)
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

    def passwd(filename, uid=nil)
      i = Passwd.new(filename)
      i.uid = uid
      i
    end

  end
end

include Serverspec::Type