# THIS IS NOW HAND MANAGED, JUST EDIT THE THING

# grab the current train release from rubygems.org
train_stable = /^train \((.*)\)/.match(`gem list ^train$ --remote`)[1]
override 'train', version: "v#{train_stable}"
override 'ruby', version: '3.1.6'

openssl_version_default =
  if macos?
    '1.1.1m'
  else
    '3.0.9'
  end

# set OPENSSL_OVERRIDE variable to a different openssl version to test
# builds for other versions in omnibus_software
override 'openssl', version: ENV.fetch('OPENSSL_OVERRIDE', openssl_version_default)

override 'ruby-msys2-devkit', version: '3.1.2-1'

override 'ruby-msys2-devkit', version: ENV.fetch('MSYS_OVERRIDE', '3.1.6-1')
