
begin
  require 'bones'
rescue LoadError
  abort '### please install the "bones" gem ###'
end

ensure_in_path 'lib'
require 'inifile'

task :default => 'test:run'
task 'gem:release' => 'test:run'

Bones {
  name         'inifile'
  summary      'INI file reader and writer'
  authors      'Tim Pease'
  email        'tim.pease@gmail.com'
  url          'http://rubygems.org/gems/inifile'
  version      IniFile::VERSION

  use_gmail
  depend_on    'bones-git', "~> 1.3", :development => true
}
