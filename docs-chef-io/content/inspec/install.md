+++
title = "Install Chef InSpec"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Install"
    identifier = "inspec/install/install"
    parent = "inspec/install"
    weight = 20
+++

Use [Chef Downloads](https://www.chef.io/downloads), an installer, script, or package manager to install Chef InSpec.

To see which platforms and platform versions Chef InSpec is supported on, see the [InSpec's platforms documentation](/inspec/platforms/).

## macOS

### CLI

You can install Chef InSpec using a curl script.

{{< note >}}Please follow steps mentioned in this document [Chef Software Install Script](/install_omnibus/). Please replace `<LICENSE_ID>` with your licenseId.{{< /note >}}

```bash
curl -L https://chefdownload-commerical.chef.io/install.sh?license_id=<LICENSE_ID> | sudo bash -s -- -P inspec
```

## Windows

### Installer

Download a Windows Chef InSpec package from [Chef Downloads](https://www.chef.io/downloads),
then double-click on the `.msi` file to launch the installer and follow the prompts.

### Powershell

You can install Chef InSpec using the following Powershell script.

```powershell
. { iwr -useb https://chefdownload-commerical.chef.io/install.ps1?license_id=<LICENSE_ID> } | iex; install -project inspec
```

Replace `<LICENSE_ID>` with your license ID.

For more information about the install script, see the [Chef Install Script documentation](/chef_install_script/).

Once you have installed Chef InSpec, run `inspec version` to verify that the installation
was successful.

## Linux

### CLI

The following curl script will install Chef InSpec for Ubuntu and Red Hat Enterprise Linux:

```bash
curl https://chefdownload-commerical.chef.io/install.sh?license_id=<LICENSE_ID> | sudo bash -s -- -P inspec
```

Replace `<LICENSE_ID>` with your license ID.

For more information about the install script, see the [Chef Install Script documentation](/chef_install_script/).

If you prefer, you can use a package manager to install Chef InSpec.
Once you downloaded the latest [Chef InSpec package](https://www.chef.io/downloads)
relevant to your Linux-based platform, use the command for the respective package
manager listed below. Replace the example file path with the file path leading to
your downloaded package.

For Ubuntu, use the following command to install Chef InSpec:

```bash
sudo dpkg -i /path/to/inspec.deb
```

For Red Hat Enterprise Linux, use the following command to install Chef InSpec:

```bash
sudo rpm -U /path-to/inspec.rpm
```

For SUSE Linux Enterprise Server, use the following command to install Chef InSpec:

```bash
sudo zypper install /path-to/inspec.rpm
```

## Next steps

After installing Chef InSpec, you must accept the Chef EULA and---starting with **Chef InSpec 6**---add a license key.
See the [Chef InSpec license documentation](/inspec/license/) to complete these tasks.
