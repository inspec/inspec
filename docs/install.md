# Installing, Upgrading, and Removing

Users can choose between operating systems of MacOS, Windows, and Linux. macOS install options include [Homebrew](https://brew.sh/), CLI, and Chef Habitat.


## Install Chef InSpec
Chef InSpec can be installed using the steps below that are appropriate for the operating system and method of Chef InSpec installation.

Start by downloading the latest [Chef InSpec package](https://downloads.chef.io/inspec) relevant to your operating system.

### macOS

#### Homebrew

Chef InSpec is available as a standalone [Homebrew](https://brew.sh/) package. Run the following command in your terminal to install Chef InSpec:

``` 
$ brew cask install chef/chef/inspec
```

While this command is running, you may be prompted to enter your macOS user account password for installation to complete.

#### CLI [DOUBLE CHECK]

Start by downloading the latest [Chef InSpec package](https://downloads.chef.io/inspec) relevant to your operating system.

Open the downloaded `.dmg` file, then open the `.pkg` file to launch the installation.

#### Habitat

Use Chef Habitat to install Chef InSpec, or include Chef InSpec in your own Chef Habitat packages. 
You can find [Chef InSpec on the Depot here](https://bldr.habitat.sh/#/pkgs/chef/inspec).


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
$ zypper install /path-to/inspec.rpm
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

Run the following command to update Chef InSpec

#### Habitat


### Windows

#### Installer

#### Powershell

#### Habitat


### Linux

#### CLI

To update Chef InSpec in Ubuntu, first uninstall  use the following command to update Chef InSpec:

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

Use Add / Remove Programs to remove Chef InSpec.

#### Powershell

Use  

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

```

#### Habitat

To uninstall the Chef InSpec package, use the following command:

```
$ hab pkg uninstall chef/inspec
```

See about available flag options in the [hab pkg uninstall documentation](https://www.habitat.sh/docs/habitat-cli/#hab-pkg-uninstall).
