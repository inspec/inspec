# THIS IS NOW HAND MANAGED, JUST EDIT THE THING

# grab the current train release from rubygems.org
train_stable = /^train \((.*)\)/.match(`gem list ^train$ --remote`)[1]
override "train", version: "v#{train_stable}"
override "ruby", version: "3.0.3"

override "libxml2", version: windows? ? "2.9.10" : "2.9.13"
override "libxslt", version: windows? ? "1.1.34" : "1.1.35"

# Mac m1
override "openssl", version: "1.1.1m" if mac_os_x?
override "nokogiri", version: "1.13.6"
