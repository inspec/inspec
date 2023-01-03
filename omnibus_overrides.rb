# THIS IS NOW HAND MANAGED, JUST EDIT THE THING

override "liblzma", version: "5.2.5"

# grab the current train release from rubygems.org
train_stable = /^train \((.*)\)/.match(`gem list ^train$ --remote`)[1]
override "train", version: "v#{train_stable}"
override :ruby, version: aix? ? "3.0.3" : "3.1.2"

# Mac m1
override "openssl", version: "1.1.1m" if mac_os_x?
override "nokogiri", version: "1.13.6"

# windows
override "ruby-windows-devkit-bash", version: "3.1.23-4-msys-1.0.18"
override "ruby-msys2-devkit", version: "3.1.2-1"
