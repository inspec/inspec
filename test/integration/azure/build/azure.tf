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

terraform {
  required_version = "~> 0.11.0"
}

# Configure the Azure RM provider
provider "azurerm" {
  version         = "~> 1.3"
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
}

# Output the sub ID so the fixture system has something to chew on
output "subscription_id" {
  value = "${var.subscription_id}"
}

# Create a resource group for the machine to be created in
resource "azurerm_resource_group" "rg" {
  name     = "Inspec-Azure"
  location = "${var.location}"

  tags {
    CreatedBy = "Inspec Azure Integration Tests"
  }
}

# Create the storage account to be used
resource "azurerm_storage_account" "sa" {
  name                     = "${var.storage_account_name}"
  location                 = "${var.location}"
  resource_group_name      = "${azurerm_resource_group.rg.name}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
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

# Create a network security group so it can be tested
resource "azurerm_network_security_group" "nsg" {
  name                = "Inspec-NSG"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"

  security_rule {
    name                       = "SSH-22"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
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

  # Attach the NSG to the subnet
  network_security_group_id = "${azurerm_network_security_group.nsg.id}"
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

resource "azurerm_network_interface" "nic3" {
  name                = "Inspec-NIC-3"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"

  ip_configuration {
    name                          = "ipConfiguration1"
    subnet_id                     = "${azurerm_subnet.subnet.id}"
    private_ip_address_allocation = "dynamic"
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
    name              = "Linux-Internal-OSDisk-MD"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
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

  # Add boot diagnostics to the machine. These will be added to the 
  # created storage acccount
  boot_diagnostics {
    enabled     = true
    storage_uri = "${azurerm_storage_account.sa.primary_blob_endpoint}"
  }
}

resource "azurerm_virtual_machine" "vm_linux_external" {
  name                  = "Linux-External-VM"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.rg.name}"
  network_interface_ids = ["${azurerm_network_interface.nic2.id}"]
  vm_size               = "Standard_DS2_v2"

  tags {
    Description = "Externally facing Linux machine to be used as a web server"
  }

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

  # Create 1 data disk to be used for testing
  storage_data_disk {
    name          = "linux-external-datadisk-1"
    vhd_uri       = "${azurerm_storage_account.sa.primary_blob_endpoint}${azurerm_storage_container.container.name}/linux-internal-datadisk-1.vhd"
    disk_size_gb  = 15
    create_option = "empty"
    lun           = 0
  }

  # Specify the name of the machine and the access credentials
  os_profile {
    computer_name  = "linux-external-1"
    admin_username = "azure"
    admin_password = "${var.admin_password}"
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/azure/.ssh/authorized_keys"
      key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDOxB7GqUxppqRBG5pB2fkkhlWkWUWmFjO3ZEc+VW70erOJWfUvhzBDDQziAOVKtNF2NsY0uyRJqwaP1idL0F7GDQtQl+HhkKW1gOCoTrNptJiYfIm05jTETRWObP0kGMPoAWlkWPBluUAI74B4nkvg7SKNpe36IZhuA8/kvVjxBfWy0r/b/dh+QEIb1eE8HfELAN8SrvrydT7My7g0YFT65V00A2HVa5X3oZaBXRKbmd5gZXBJXEbgHZqA9+NnIQkZXH0vkYYOQTANB8taVwjNVftpXzf2zEupONCYOOoIAep2tXuv2YmWuHr/Y5rCv2mK28ZVcM7W9UmwM0CMHZE7 azure@inspec.local"
    }
  }
}

resource "azurerm_virtual_machine" "vm_windows_internal" {
  name                  = "Windows-Internal-VM"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.rg.name}"
  network_interface_ids = ["${azurerm_network_interface.nic3.id}"]
  vm_size               = "Standard_DS2_v2"

  # Configure machine with Ubuntu
  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  # Create the OS disk
  storage_os_disk {
    name              = "Windows-Internal-OSDisk-MD"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  # Create 1 data disk to be used for testing
  storage_data_disk {
    name              = "Windows-Internal-DataDisk-1-MD"
    create_option     = "Empty"
    managed_disk_type = "Standard_LRS"
    lun               = 0
    disk_size_gb      = "1024"
  }

  # Specify the name of the machine and the access credentials
  os_profile {
    computer_name  = "win-internal-1"
    admin_username = "azure"
    admin_password = "${var.admin_password}"
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }
}
