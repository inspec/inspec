# THIS IS NOW HAND MANAGED, JUST EDIT THE THING

# grab the current train release from rubygems.org
train_stable = /^train \((.*)\)/.match(`gem list ^train$ --remote`)[1]
override "train", version: "v#{train_stable}"
override "ruby", version: "3.1.6"

# Check the platform and use OpenSSL 1.1.1t for Windows, else use 3.0.11
if Gem::Platform.local.os == 'mswin' || Gem::Platform.local.os == 'mingw'
  override :openssl, version: "1.1.1t"
else
  override :openssl, version: "3.0.11"
end

override "ruby-msys2-devkit", version: "3.1.6-1"
