# Ruby GSSAPI Library

This is a wrapper around the system GSSAPI library (MIT only at this time).  It exposes the low-level GSSAPI methods like gss_init_sec_context and gss_wrap and also provides an easier to use wrapper on top of this for common usage scenarios.


I'm going to try and maintain most of the docs in the Github WIKI for this project so please check there for documentation and examples.

https://github.com/zenchild/gssapi/wiki


Also check out the examples directory for some stubbed out client/server examples.


## Note on IOV and AEAD functions

If you require the IOV and AEAD functions you will have to `require "gssapi/extensions"` to gain access to them.


#### License

Copyright © 2010 Dan Wanek <dan.wanek@gmail.com>
Ruby gssapi is licensed under the MIT license (see COPYING)
