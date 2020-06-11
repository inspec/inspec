## Version 1.1.1
  * Allow GssApiError to be initialized with string.
  * Add display_name wrapper for gss_display_name to GSSAPI::Simple
  * gss_iov examples
  * Ruby 1.8.x support
  * Change loader for MIT and Heimdal to be a bit cleaner. Fix syntax in simple.rb
  * Do a gss_acquire_cred for every connection to the server.
  * updating path to gssapi32.dll

## Version 1.1.2
  * add gss_get_mic

## Version 1.2.0
  * Move IOV and AEAD to gssapi/extensions.rb so it can be loaded separately when needed

## Version 1.3.0

Sorry everyone that this has taken so long to go out. I don't really work much
with GSSAPI so it hasn't been a priority for me.

  * Implemented delegation and added verify_mic. Thanks @mfazekas
  * Add loading of MIT GSS libs for solaris/smartos. Thanks @fac
  * Fix corruption in iov_decrypt example. Thanks @Iristyle
