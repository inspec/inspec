# encoding: utf-8
# Copyright:: Copyright (c) 2015 Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

class Markdown
  class << self
    def h1(msg)
      "# #{msg}\n\n"
    end

    def h2(msg)
      "## #{msg}\n\n"
    end

    def h3(msg)
      "### #{msg}\n\n"
    end

    def code(msg, syntax = nil)
      "```#{syntax}\n"\
      "#{msg}\n"\
      "```\n\n"
    end

    def li(msg)
      "* #{msg.gsub("\n", "\n    ")}\n"
    end

    def ul(msg)
      msg + "\n"
    end

    def p(msg)
      "#{msg}\n\n"
    end

    def suffix
      '.md'
    end
  end
end

class RST
  class << self
    def h1(msg)
      "=====================================================\n"\
      "#{msg}\n"\
      "=====================================================\n\n"\
    end

    def h2(msg)
      "#{msg}\n"\
      "=====================================================\n\n"\
    end

    def h3(msg)
      "#{msg}\n"\
      "-----------------------------------------------------\n\n"\
    end

    def code(msg, syntax = nil)
      ".. code-block:: #{syntax}\n\n"\
      "   #{msg.gsub("\n", "\n   ")}\n\n"
    end

    def li(msg)
      "#{msg.gsub("\n", "\n   ")}\n\n"
    end

    def ul(msg)
      msg
    end

    def p(msg)
      "#{msg}\n\n"
    end

    def suffix
      '.rst'
    end
  end
end

namespace :docs do
  desc 'Create cli docs'
  task :cli do
    f = RST
    res = f.h1('InSpec CLI') +
          f.p('Use the InSpec CLI to run tests and audits against targets '\
              'using local, SSH, WinRM, or Docker connections.')

    require 'inspec/cli'
    cmds = Inspec::InspecCLI.all_commands
    cmds.keys.sort.each do |key|
      cmd = cmds[key]

      res << f.h2(cmd.usage.split.first)
      res << f.p(cmd.description.capitalize)

      res << f.h3('Syntax')
      res << f.p('This subcommand has the following syntax:')
      res << f.code("$ inspec #{cmd.usage}", 'bash')

      opts = cmd.options.select { |_, o| !o.hide }
      unless opts.empty?
        res << f.h3('Options') + f.p('This subcommand has additional options:')

        list = ''
        opts.keys.sort.each do |option|
          opt = cmd.options[option]
          # TODO: remove when UX of help is reworked 1.0
          usage = opt.usage.split(', ')
                     .map { |x| x.tr('[]', '') }
                     .map { |x| x.start_with?('-') ? x : '-'+x }
                     .map { |x| '``' + x + '``' }
          list << f.li("#{usage.join(', ')}\n#{opt.description}")
        end.join
        res << f.ul(list)
      end

      # FIXME: for some reason we have extra lines in our RST; needs investigation
      res << "\n\n" if f == RST
    end

    dst = 'docs/cli' + f.suffix
    File.write(dst, res)
    puts "Documentation generated in #{dst.inspect}"
  end
end
