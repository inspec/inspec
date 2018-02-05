# Main AWS loader file.  The intent is for this to be
# loaded only if AWS resources are needed.

require 'aws-sdk' # TODO: split once ADK v3 is in use
require '_aws_backend_factory_mixin'
require '_aws_resource_mixin'
require '_aws_singular_resource_mixin'
require '_aws_plural_resource_mixin'
require '_aws_backend_base'
