# Configure variables
variable "storage_account_name" {}
variable "admin_password" {}

variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

# Set a unique string which will be appended to public facing items
# to ensure there are no clashes
variable "suffix" {}

variable "location" {
  default = "West Europe"
}

# Configure the Azure RM provider
provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
}

# Create a resource group for the machine to be created in
resource "azurerm_resource_group" "rg" {
  name     = "Inspec-Azure"
  location = "${var.location}"
}

# Create the storage account to be used
resource "azurerm_storage_account" "sa" {
  name                = "${var.storage_account_name}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  account_type        = "Standard_LRS"
}

# Create the container in which the hard disks for the machine(s) will be stored
resource "azurerm_storage_container" "container" {
  name                  = "vhds"
  resource_group_name   = "${azurerm_resource_group.rg.name}"
  storage_account_name  = "${azurerm_storage_account.sa.name}"
  container_access_type = "private"
}

# Create a Public IP
resource "azurerm_public_ip" "public_ip_1" {
  name                         = "Inspec-PublicIP-1"
  location                     = "${var.location}"
  resource_group_name          = "${azurerm_resource_group.rg.name}"
  public_ip_address_allocation = "dynamic"
  domain_name_label            = "linux-external-1-${var.suffix}"
}

# Create the virtual network for the machines
resource "azurerm_virtual_network" "vnet" {
  name                = "Inspec-VNet"
  address_space       = ["10.1.1.0/24"]
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
}

# Create the subnet
resource "azurerm_subnet" "subnet" {
  name                 = "Inspec-Subnet"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  address_prefix       = "10.1.1.0/24"
}

# Create the NIC for the internal machine
# Give the machine a static IP Address
resource "azurerm_network_interface" "nic1" {
  name                = "Inspec-NIC-1"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"

  ip_configuration {
    name                          = "ipConfiguration1"
    subnet_id                     = "${azurerm_subnet.subnet.id}"
    private_ip_address_allocation = "static"
    private_ip_address            = "10.1.1.10"
  }
}

resource "azurerm_network_interface" "nic2" {
  name                = "Inspec-NIC-2"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"

  ip_configuration {
    name                          = "ipConfiguration1"
    subnet_id                     = "${azurerm_subnet.subnet.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${azurerm_public_ip.public_ip_1.id}"
  }
}

# Create the machine for testing
resource "azurerm_virtual_machine" "vm_linux_internal" {
  name                  = "Linux-Internal-VM"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.rg.name}"
  network_interface_ids = ["${azurerm_network_interface.nic1.id}"]
  vm_size               = "Standard_DS2_v2"

  # Configure machine with Ubuntu
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04.0-LTS"
    version   = "latest"
  }

  # Create the OS disk
  storage_os_disk {
    name          = "linux-internal-osdisk"
    vhd_uri       = "${azurerm_storage_account.sa.primary_blob_endpoint}${azurerm_storage_container.container.name}/linux-internal-osdisk.vhd"
    caching       = "ReadWrite"
    create_option = "FromImage"
  }

  # Create 1 data disk to be used for testing
  storage_data_disk {
    name          = "linux-datadisk-1"
    vhd_uri       = "${azurerm_storage_account.sa.primary_blob_endpoint}${azurerm_storage_container.container.name}/linux-internal-datadisk-1.vhd"
    disk_size_gb  = 15
    create_option = "empty"
    lun           = 0
  }

  # Specify the name of the machine and the access credentials
  os_profile {
    computer_name  = "linux-internal-1"
    admin_username = "azure"
    admin_password = "${var.admin_password}"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_virtual_machine" "vm_linux_external" {
  name                  = "Linux-External-VM"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.rg.name}"
  network_interface_ids = ["${azurerm_network_interface.nic2.id}"]
  vm_size               = "Standard_DS2_v2"

  # Configure machine with Ubuntu
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04.0-LTS"
    version   = "latest"
  }

  # Create the OS disk
  storage_os_disk {
    name          = "linux-external-osdisk"
    vhd_uri       = "${azurerm_storage_account.sa.primary_blob_endpoint}${azurerm_storage_container.container.name}/linux-external-osdisk.vhd"
    caching       = "ReadWrite"
    create_option = "FromImage"
  }

  # Specify the name of the machine and the access credentials
  os_profile {
    computer_name  = "linux-external-1"
    admin_username = "azure"
    admin_password = "${var.admin_password}"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}
