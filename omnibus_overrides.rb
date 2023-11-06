# THIS IS NOW HAND MANAGED, JUST EDIT THE THING

# grab the current train release from rubygems.org
train_stable = /^train \((.*)\)/.match(`gem list ^train$ --remote`)[1]
override "train", version: "v#{train_stable}"
override "ruby", version: "3.1.2"

# Mac Apple Silicon requires 1.1.1 series instead of 1.0.2 series
if mac_os_x?
  override "openssl", version: "1.1.1w"
else
  # Hopefully temporary, in October 2023 the default is 1.0.2zg which
  # has an open high cve, while zi is available. Temporarily pin until
  # default in omnibus-software has no cves.
  override "openssl", version: "1.0.2zi"
end

override "ruby-msys2-devkit", version: "3.1.2-1"
