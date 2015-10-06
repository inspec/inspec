# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann
#
# This is heavily based on:
#
#   OHAI https://github.com/chef/ohai
#   by Adam Jacob, Chef Software Inc
#

class Vulcano::Plugins::Backend
  module DetectUnix
    def detect_via_uname # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength
      case uname_s.downcase
      when /aix/
        @platform[:family] = 'aix'
        out = @backend.run_command('uname -rvp').stdout
        m = out.match(/(\d+)\s+(\d+)\s+(.*)/)
        unless m.nil?
          @platform[:release] = "#{m[2]}.#{m[1]}"
          @platform[:arch] = m[3].to_s
        end

      when /freebsd/
        @platform[:family] = 'freebsd'
        @platform[:name] = uname_s.lines[0].chomp
        @platform[:release] = uname_r.lines[0].chomp

      when /netbsd/
        @platform[:family] = 'netbsd'
        @platform[:name] = uname_s.lines[0].chomp
        @platform[:release] = uname_r.lines[0].chomp

      when /openbsd/
        @platform[:family] = 'openbsd'
        @platform[:name] = uname_s.lines[0].chomp
        @platform[:release] = uname_r.lines[0].chomp

      when /sunos/
        @platform[:family] = 'solaris'
        if uname_r =~ /5\.10/
          # TODO: should be string!
          @platform[:release] = 10
        else
          rel = get_config('/etc/release')
          case rel
          when /^.*(SmartOS).*$/
            @platform[:family] = 'smartos'
          when !(m = /^\s*(OmniOS).*r(\d+).*$/).nil?
            @platform[:family] = 'omnios'
            @platform[:release] = m[2]
          when !(m = /^\s*(OpenIndiana).*oi_(\d+).*$/).nil?
            @platform[:family] = 'openindiana'
            @platform[:release] = m[2]
          when /^\s*(OpenSolaris).*snv_(\d+).*$/
            @platform[:family] = 'opensolaris'
            @platform[:release] = m[2]
          when !(m = /Oracle Solaris (\d+)/).nil?
            # TODO: should be string!
            @platform[:release] = m[1].to_i
            @platform[:family] = 'solaris2'
          when /^\s*(Solaris)\s.*$/
            @platform[:family] = 'solaris2'
          when /^\s*(NexentaCore)\s.*$/
            @platform[:family] = 'nexentacore'
          end
        end

      else
        # in all other cases we didn't detect it
        return false
      end
      # when we get here the detection returned a result
      true
    end
  end
end
