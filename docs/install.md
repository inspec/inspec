# Installing, Upgrading, and Removing

Users can choose between operating systems of MacOS, Windows, and Linux for Chef InSpec.

## Install Chef InSpec

You can download the latest [Chef InSpec package](https://downloads.chef.io/inspec) relevant to your operating system. 

Alternatively, Chef InSpec can be installed via script according to your operating system and method through the methods below.
macOS install options include [Homebrew](https://brew.sh/), CLI, and Chef Habitat. Windows install options include Installer, Powershell, and Chef Habitat. Linux install options covers Ubuntu, Red Hat Enterprise Linux, and SUSE Linux Enterprise Server.

### macOS

#### Homebrew

Chef InSpec is available as a standalone [Homebrew](https://brew.sh/) package. Run the following command in your terminal to install Chef InSpec:

``` 
$ brew cask install chef/chef/inspec
```

While this command is running, you may be prompted to enter your macOS user account password for installation to complete.

#### CLI

You can download Chef InSpec via script:
```
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec
```

#### Habitat

Use Chef Habitat to install Chef InSpec, or include Chef InSpec in your own Chef Habitat packages. Chef InSpec is available [on the Habitat Builder Depot](https://bldr.habitat.sh/#/pkgs/chef/inspec).

Use the following command to install the Chef InSpec package:

```
$ hab pkg uninstall chef/inspec
```

See about available flag options in the [hab pkg install documentation](https://www.habitat.sh/docs/habitat-cli/#hab-pkg-install).

### Windows

#### Installer

Start by downloading the latest [Chef InSpec package](https://downloads.chef.io/inspec) relevant to your operating system version.

Once downloaded, double-click the `.msi` file to launch the installer and follow the prompts.

#### Powershell

Use the following command to install Chef InSpec via Powershell:

```powershell
. { iwr -useb https://omnitruck.chef.io/install.ps1 } | iex; install -project inspec
```

Once Chef InSpec is installed, run `inspec version` to verify that the installation was successful.

#### Habitat

Use Chef Habitat to install Chef InSpec, or include Chef InSpec in your own Chef Habitat packages. 
You can find [Chef InSpec on the Depot here](https://bldr.habitat.sh/#/pkgs/chef/inspec).

### Linux

#### CLI

For Ubuntu, use the following command to install Chef InSpec:

```
sudo dpkg -i /path/to/inspec.deb
```

For Red Hat Enterprise Linux, use the following command to install Chef InSpec:

```
sudo rpm -U /path-to/inspec.rpm
```

For SUSE Linux Enterprise Server, use the following command to install Chef InSpec: 

```
zypper install /path-to/inspec.rpm
```

#### Habitat

Use Chef Habitat to install Chef InSpec, or include Chef InSpec in your own Chef Habitat packages. 
You can find [Chef InSpec on the Depot here](https://bldr.habitat.sh/#/pkgs/chef/inspec).


## Update Chef InSpec

### macOS

#### Homebrew

Run the following command to update Chef InSpec on Homebrew:

```
brew cask upgrade inspec
```

#### CLI

#### Habitat



### Windows

#### Installer

#### Powershell

#### Habitat



### Linux

#### CLI

To update Chef InSpec in Ubuntu, use the following command to update Chef InSpec:

```
sudo dpkg -i /path/to/inspec.deb
```

For Red Hat Enterprise Linux, use the following command to update Chef InSpec:
```
sudo rpm -U /path-to/inspec.rpm
```

For SUSE Linux Enterprise Server, use the following command to update Chef InSpec: 

```

```

#### Habitat


## Uninstall Chef InSpec

Chef InSpec can be uninstalled using the steps below that are appropriate for the method of Chef InSpec installation.

### macOS

#### Homebrew

Use the following *destructive* command to remove the Chef InSpec standalone Homebrew package:

```
$ brew uninstall --force chef/chef/inspec
```

#### CLI

Ue the following *destructive* command in your terminal to remove the Chef InSpec package:

```
$ sudo rm -rf /opt/inspec
```

#### Habitat

To uninstall the Chef InSpec package, use the following command:

```
$ hab pkg uninstall chef/inspec
```

See about available flag options in the [hab pkg uninstall documentation](https://www.habitat.sh/docs/habitat-cli/#hab-pkg-uninstall).


### Windows

#### Installer

Use *Add / Remove Programs* to remove Chef InSpec.

#### Powershell
 

#### Habitat

To uninstall the Chef InSpec package, use the following command:

```
$ hab pkg uninstall chef/inspec
```

See about available flag options in the [hab pkg uninstall documentation](https://www.habitat.sh/docs/habitat-cli/#hab-pkg-uninstall).

### Linux

#### CLI [TO FIX]

For Ubuntu, use the following command to uninstall:

```
sudo dpkg -P inspec
```

For Red Hat Enterprise Linux, use the following command to uninstall:

```
sudo rpm -e inspec
```

For SUSE Linux Enterprise Server, use the following command to uninstall Chef InSpec: 

```
zypper remove inspec
```

#### Habitat

To uninstall the Chef InSpec package, use the following command:

```
$ hab pkg uninstall chef/inspec
```

See about available flag options in the [hab pkg uninstall documentation](https://www.habitat.sh/docs/habitat-cli/#hab-pkg-uninstall).
