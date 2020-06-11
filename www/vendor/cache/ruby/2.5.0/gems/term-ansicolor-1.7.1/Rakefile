# vim: set filetype=ruby et sw=2 ts=2:

require 'gem_hadar'

GemHadar do
  name        'term-ansicolor'
  path_name   'term/ansicolor'
  path_module 'Term::ANSIColor'
  author      'Florian Frank'
  email       'flori@ping.de'
  homepage    "http://flori.github.com/#{name}"
  summary     'Ruby library that colors strings using ANSI escape sequences'
  description 'This library uses ANSI escape sequences to control the attributes of terminal output'
  licenses    << 'Apache-2.0'

  test_dir    'tests'
  ignore      '.*.sw[pon]', 'pkg', 'Gemfile.lock', '.rvmrc', 'coverage',
    'tags', '.bundle', '.byebug_history'

  readme      'README.md'
  executables.merge Dir['bin/*'].map { |x| File.basename(x) }

  dependency             'tins', '~>1.0'
  development_dependency 'simplecov'
  development_dependency 'test-unit'

  required_ruby_version '>= 2.0'
end
