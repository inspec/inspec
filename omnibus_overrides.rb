# THIS IS NOW HAND MANAGED, JUST EDIT THE THING

# grab the current train release from rubygems.org
train_stable = /^train \((.*)\)/.match(`gem list ^train$ --remote`)[1]
override "train", version: "v#{train_stable}"
override "ruby", version: "3.1.2"

# Mac m1
# JFM - override "openssl", version: "1.1.1m" if mac_os_x?
override "openssl", version: mac_os_x? ? "1.1.1m" : "1.0.2zb"
