# THIS IS NOW HAND MANAGED, JUST EDIT THE THING

# grab the current train release from rubygems.org
train_stable = /^train \((.*)\)/.match(`gem list ^train$ --remote`)[1]
override 'train', version: "v#{train_stable}"
override 'ruby', version: '3.1.7'

override :openssl, version: '3.2.6'
override :libffi, version: '3.4.6' # Pinning to this version, as 3.4.4 is incompatible with RHEL-10.
override :zlib, version: '1.3.1'

override 'ruby-msys2-devkit', version: '3.1.7-1'
