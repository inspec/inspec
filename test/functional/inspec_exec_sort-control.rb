# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'functional/helper'

describe 'inspec exec --sort-controls' do
  include FunctionalHelper
  let(:looks_like_a_stacktrace) { %r{lib/inspec/.+\.rb:\d+:in} }

  describe 'when passing in multiple profiles given an inherited profile that has more that one test per control block' do
     # Control files will be sorted 'within a single profile'. Controls within a control file will not be sorted.
     # --sort-files is of no use on filesystems/OS that have autosort, like Windows has.
     # therefor, the default behaviour of 'random' order cannot be tested.
  
     it 'sorts the controls within a single profile' do
#       let(:out) { inspec('exec ' + File.join(profile_path, 'sort-controls', 'profile_layer_top') + ' --sort-controls --no-create-lockfile') }
       out = inspec('exec ' + File.join(profile_path, 'sort-controls', 'profile_layer_top') + ' --sort-controls --no-create-lockfile')
       out.stderr.must_equal ''
       out.exit_status.must_equal 0
       stdout = out.stdout.force_encoding(Encoding::UTF_8)
       stdout.must_include "
\e[38;5;41m  \u2714  test-1a: Create /tmp directory\e[0m
\e[38;5;41m     \u2714  File /tmp should be directory\e[0m
\e[38;5;41m  \u2714  test-2a: Create /tmp directory\e[0m
\e[38;5;41m     \u2714  File /tmp should be directory\e[0m
\e[38;5;41m  \u2714  test-3a: Create /tmp directory\e[0m
\e[38;5;41m     \u2714  File /tmp should be directory\e[0m
"
       stdout.must_include "
\e[38;5;41m  \u2714  test-1d: Create /tmp directory\e[0m
\e[38;5;41m     \u2714  File /tmp should be directory\e[0m
\e[38;5;41m  \u2714  test-2d: Create /tmp directory\e[0m
\e[38;5;41m     \u2714  File /tmp should be directory\e[0m
\e[38;5;41m  \u2714  test-3d: Create /tmp directory\e[0m
\e[38;5;41m     \u2714  File /tmp should be directory\e[0m
"
       stdout.must_include "
\e[38;5;41m  \u2714  test-1c: Create /tmp directory\e[0m
\e[38;5;41m     \u2714  File /tmp should be directory\e[0m
\e[38;5;41m  \u2714  test-2c: Create /tmp directory\e[0m
\e[38;5;41m     \u2714  File /tmp should be directory\e[0m
\e[38;5;41m  \u2714  test-3c: Create /tmp directory\e[0m
\e[38;5;41m     \u2714  File /tmp should be directory\e[0m
"
       stdout.must_include "
\e[38;5;41m  \u2714  test-1b: Create /tmp directory\e[0m
\e[38;5;41m     \u2714  File /tmp should be directory\e[0m
\e[38;5;41m  \u2714  test-2b: Create /tmp directory\e[0m
\e[38;5;41m     \u2714  File /tmp should be directory\e[0m
\e[38;5;41m  \u2714  test-3b: Create /tmp directory\e[0m
\e[38;5;41m     \u2714  File /tmp should be directory\e[0m
"
       end
  end
end
