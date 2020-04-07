# frozen_string_literal: true

module Inspec
  module Dist
    # When referencing a product directly, like InSpec
    PRODUCT_NAME = "Chef InSpec"

    # The inspec executable
    EXEC_NAME = "inspec"

    # The name of the server product
    SERVER_PRODUCT_NAME = "Chef Server"

    # name of the automate product
    AUTOMATE_PRODUCT_NAME = "Chef Automate"

    # name of the compliance product
    COMPLIANCE_PRODUCT_NAME = "Chef Compliance"

    # The suffix for workstation's eponymous folders, like /opt/workstation
    # or C:/<LEGACY_CONF_DIR>/workstation
    WORKSTATION_DIR_SUFFIX = "chef-workstation"

    # The suffix for ChefDK's eponymous folders, like /opt/chef-dk
    # or C:/<LEGACY_CONF_DIR>/chef-dk
    CHEFDK_DIR_SUFFIX = "chef-dk"

    # The suffix for Inspec's eponymous folders, like /opt/inspec
    # or C:/<LEGACY_CONF_DIR>/inspec
    INSPEC_DIR_SUFFIX = "inspec"

    # The legacy conf folder: C:/opscode/chef*. Specifically the "opscode" part
    # relevant *_DIR_SUFFIX is appended to it in code when needed
    LEGACY_CONF_DIR = "opscode"
  end
end
