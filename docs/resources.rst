=====================================================
InSpec Resources Reference
=====================================================

The following InSpec resources are available:

* ``apt``
* ``bond``
* ``bridge``
* ``command``
* ``directory``
* ``file``
* ``gem``
* ``group``
* ``host``
* ``interface``
* ``kernel_module``
* ``kernel_parameter``
* ``npm``
* ``oneget``
* ``os``
* ``os_env``
* ``package``
* ``pip``
* ``port``
* ``processes``
* ``registry_key``
* ``script``
* ``service``
* ``user``
* ``windows_feature``
* ``yum``

In addition to the open source resources, Chef Compliance ships with additional resources:

* ``apache_conf``
* ``audit_policy``
* ``audit_daemon_conf``
* ``audit_daemon_rules``
* ``csv``
* ``etc_group``
* ``group_policy``
* ``inetd_config``
* ``json``
* ``limits_conf``
* ``login_defs``
* ``mysql``
* ``mysql_conf``
* ``mysql_session``
* ``ntp_conf``
* ``parse_config``
* ``parse_config_file``
* ``passwd``
* ``postgres``
* ``postgres_conf``
* ``postgres_session``
* ``security_policy``
* ``ssh_config``
* ``sshd_config``
* ``yaml``

See below for more information about each InSpec resource, its related matchers, and examples of how to use it in a recipe.

apache_conf
=====================================================
Use the ``apache_conf`` InSpec resource to xxxxx.

IN_PROGRESS

apt -- DONE
-----------------------------------------------------
Use the ``apt`` InSpec resource to verify |apt| repositories on the |debian| and |ubuntu| platforms, and also |ppa| repositories on the |ubuntu| platform.

Syntax -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
An ``apt`` InSpec resource block tests the contents of |apt| and |ppa| repositories. For example:

.. code-block:: ruby

   describe apt('path') do
     it { should exist }
     it { should be_enabled }
   end

where

* ``apt('path')`` must specify an |apt| or |ppa| repository
* ``('path')`` may be an ``http://`` address, a ``ppa:`` address, or a short ``repo-name/ppa`` address
* ``exist`` and ``be_enabled`` are a valid matchers for this InSpec resource

Matchers -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
This InSpec resource has the following matchers.

be_enabled -- DONE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The ``be_enabled`` matcher tests if a package exists in the repository. For example:

.. code-block:: ruby

   it { should be_enabled }

exist -- DONE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The ``exist`` matcher tests if a package exists on the system. For example:

.. code-block:: ruby

   it { should exist }

Examples -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The following examples show how to use this InSpec resource in a test.

**Test if Ubuntu is updated to the latest stable Juju package**

.. code-block:: ruby

   describe apt('http://ppa.launchpad.net/juju/stable/ubuntu') do
     it { should exist }
     it { should be_enabled }
   end

**Test if Nginx is updated to the latest stable package**

.. code-block:: ruby

   describe apt('ppa:nginx/stable') do
     it { should exist }
     it { should be_enabled }
   end

**Verify that a repository exists and is enabled**

.. code-block:: ruby

   describe apt('ppa:nginx/stable') do
     it { should exist }
     it { should be_enabled }
   end

**Verify that a repository is not present**

.. code-block:: ruby

   describe apt('ubuntu-wine/ppa') do
     it { should_not exist }
     it { should_not be_enabled }
   end


audit_policy
=====================================================
Use the ``audit_policy`` InSpec resource to xxxxx.

IN_PROGRESS



audit_daemon_conf
=====================================================
Use the ``audit_daemon_conf`` InSpec resource to xxxxx.

IN_PROGRESS



audit_daemon_rules
=====================================================
Use the ``audit_daemon_rules`` InSpec resource to xxxxx.

IN_PROGRESS



bond
=====================================================
Use the ``bond`` InSpec resource to test a logical, bonded network interface (i.e. "two or more network interfaces aggregated into a single, logical network interface"). On |unix| and |linux| platforms, any value in the ``/proc/net/bonding`` directory may be tested.

IN_PROGRESS



bridge -- DONE
=====================================================
Use the ``bridge`` InSpec resource to test basic network bridge properties, such as name, if an interface is defined, and the associations for any defined interface.

* On |unix| and |linux| platforms, any value in the ``/sys/class/net/{interface}/bridge`` directory may be tested
* On the |windows| platform, the ``Get-NetAdapter`` cmdlet is associated with the ``Get-NetAdapterBinding`` cmdlet and returns the ``ComponentID ms_bridge`` value as a |json| object

.. not sure the previous two bullet items are actually true, but keeping there for reference for now, just in case

Syntax -- DONE
-----------------------------------------------------
A ``bridge`` InSpec resource block declares xxxxx. For example:

.. code-block:: ruby

   describe bridge('br0') do
     it { should exist }
     it { should have_interface 'eth0' }
   end

..
.. where
..
.. * ``xxxxx`` must specify xxxxx
.. * xxxxx
.. * ``xxxxx`` is a valid matcher for this InSpec resource
..

Matchers -- DONE
-----------------------------------------------------
This InSpec resource has the following matchers.

exist -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``exist`` matcher tests if the network bridge is available. For example:

.. code-block:: ruby

   it { should exist }

have_interface -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``have_interface`` matcher tests if the named interface is defined for the network bridge. For example:

.. code-block:: ruby

   it { should have_interface 'eth0' }

interfaces -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``interfaces`` matcher tests if the named interface is present. For example:

.. code-block:: ruby

   its(:interfaces) { should eq foo }
   its(:interfaces) { should eq bar }
   its(:interfaces) { should include foo, bar }

.. wild guessing ^^^

..
.. Examples
.. -----------------------------------------------------
.. The following examples show how to use this InSpec resource in a recipe.
..
.. **xxxxx**
..
.. xxxxx
..
.. **xxxxx**
..
.. xxxxx
..



command
=====================================================
Use the ``command`` InSpec resource to test an arbitrary command.

IN_PROGRESS



csv
=====================================================
Use the ``csv`` InSpec resource to xxxxx.

IN_PROGRESS


directory
=====================================================
Use the ``directory`` InSpec resource to xxxxx.

IN_PROGRESS



etc_group
-----------------------------------------------------
Use the ``etc_group`` InSpec resource to test the contents of the ``/etc/group`` file on |linux| and |unix| platforms. The ``/etc/group`` file stores details about each group---group name, password, group identifier, and a comma-separate list of users that belong to the group.

IN_PROGRESS



file
=====================================================
Use the ``file`` InSpec resource to xxxxx.

IN_PROGRESS


gem -- DONE
-----------------------------------------------------
Use the ``gem`` InSpec resource to test if a global |gem| package is installed.

Syntax -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
A ``gem`` InSpec resource block declares a package and (optionally) a package version. For example:

.. code-block:: ruby

   describe gem('gem_package_name') do
     it { should be_installed }
   end

where

* ``('gem_package_name')`` must specify a |gem| package, such as ``'rubocop'``
* ``be_installed`` is a valid matcher for this InSpec resource

Matchers -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
This InSpec resource has the following matchers.

be_installed -- DONE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The ``be_installed`` matcher tests if the named |gem| package is installed. For example:

.. code-block:: ruby

   it { should be_installed }

version -- DONE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The ``version`` matcher tests if the named package version is on the system. For example:

.. code-block:: ruby

   its(:version) { should eq '0.33.0' }

Examples -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The following examples show how to use this InSpec resource in a test.

**Verify that a gem package is installed, with a specific version**

.. code-block:: ruby

   describe gem('rubocop') do
     it { should be_installed }
     its(:version) { should eq '0.33.0' }
   end

**Verify that a gem package is not installed**

.. code-block:: ruby

   describe gem('rubocop') do
     it { should_not be_installed }
   end



group
=====================================================
Use the ``group`` InSpec resource to xxxxx.

IN_PROGRESS



group_policy
=====================================================
Use the ``group_policy`` InSpec resource to xxxxx.

IN_PROGRESS



host -- DONE
=====================================================
Use the ``host`` InSpec resource to test the name used to refer to a specific host and its availability, including the Internet protocols and ports over which that host name should be available.

Syntax -- DONE
-----------------------------------------------------
A ``host`` InSpec resource block declares a host name, and then (depending on what is to be tested) a port and/or a protocol. For example:

.. code-block:: ruby

   describe host('example.com', port: 80, proto: 'udp') do
     it { should be_reachable }
   end

where

* ``host()`` must specify a host name and may specify a port number and/or a protocol
* ``'example.com'`` is the host name
* ``port:`` is the port number
* ``proto: 'name'`` is the Internet protocol: |icmp| (``proto: 'icmp'``), |tcp| (``proto: 'tcp'``), or |udp| (``proto: 'udp'``)
* ``be_reachable`` is a valid matcher for this InSpec resource

Matchers -- DONE
-----------------------------------------------------
This InSpec resource has the following matchers.

be_reachable -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``be_reachable`` matcher tests if the host name is available. For example:

.. code-block:: ruby

     it { should be_reachable }


be_resolvable -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``be_resolvable`` matcher tests for host name resolution, i.e. "resolvable to an IP address". For example:

.. code-block:: ruby

     it { should be_resolvable }


ipaddress -- DONE
-----------------------------------------------------
The ``ipaddress`` matcher tests if a host name is resolvable to a specific IP address. For example:

.. code-block:: ruby

     its(:ipaddress) { should include '93.184.216.34' }


Examples -- DONE
-----------------------------------------------------
The following examples show how to use this InSpec resource in a recipe.

**Verify host name s reachable over a specific protocol and port number**

.. code-block:: ruby

   describe host('example.com', port: 53, proto: 'udp') do
     it { should be_reachable }
   end

**Verify that a specific IP address can be resolved**

.. code-block:: ruby

   describe host('example.com', port: 80, proto: 'tcp') do
     it { should be_resolvable }
     its(:ipaddress) { should include '192.168.1.1' }
   end


inetd_config -- DONE
=====================================================
Use the ``inetd_config`` InSpec resource to test if a service is enabled in the ``inetd.conf`` file on |linux| and |unix| platforms. |inetd|---the Internet service daemon---listens on dedicated ports, and then loads the appropriate program based on a request. The ``inetd.conf`` file is typically located at ``/etc/inetd.conf`` and contains a list of Internet services associated to the ports on which that service will listen. Only enabled services may handle a request; only services that are required by the system should be enabled.

Syntax -- DONE
-----------------------------------------------------
A ``inetd_config`` InSpec resource block declares the list of services that should be disabled in the ``inetd.conf`` file. For example:

.. code-block:: ruby

   describe inetd_config('path') do
     its(:service_name) { should eq 'value' }
   end

where

* ``'service_name'`` is a service listed in the ``inetd.conf`` file
* ``('path')`` is the non-default path to the ``inetd.conf`` file
* ``should eq 'value'`` is the value that is expected

Matchers -- DONE
-----------------------------------------------------
This InSpec resource matches any service that is listed in the ``inetd.conf`` file. For example:

.. code-block:: ruby

     its(:shell) { should eq nil }

or:

.. code-block:: ruby

     its(:netstat) { should eq nil }

or:

.. code-block:: ruby

     its(:systat) { should eq nil }

For example:

.. code-block:: ruby

   describe inetd_conf do
     its(:shell) { should eq nil }
     its(:login) { should eq nil }
     its(:exec) { should eq nil }
   end

Examples -- DONE
-----------------------------------------------------
The following examples show how to use this InSpec resource in a recipe.

**Verify that FTP is disabled**

The contents if the ``inetd.conf`` file contain the following:

.. code-block:: text

   #ftp      stream   tcp   nowait   root   /usr/sbin/tcpd   in.ftpd -l -a
   #telnet   stream   tcp   nowait   root   /usr/sbin/tcpd   in.telnetd

and the following test is defined:

.. code-block:: ruby

   describe inetd_config do
     its(:ftp) { should eq nil }
     its(:telnet) { should eq nil }
   end

Because both the ``ftp`` and ``telnet`` Internet services are commented out (``#``), both services are disabled. Consequently, both tests will return ``true``. However, if the ``inetd.conf`` file is set as follows:

.. code-block:: text

   ftp       stream   tcp   nowait   root   /usr/sbin/tcpd   in.ftpd -l -a
   #telnet   stream   tcp   nowait   root   /usr/sbin/tcpd   in.telnetd

then the same test will return ``false`` for ``ftp`` and the entire test will fail.

**Test if telnet is installed**

.. code-block:: ruby

   describe package('telnetd') do
     it { should_not be_installed }
   end

   describe inetd_conf do
     its('telnet') { should eq nil }
   end


interface -- DONE
=====================================================
Use the ``interface`` InSpec resource to test basic network adapter properties, such as name, status, state, address, and link speed (in MB/sec).

* On |unix| and |linux| platforms, any value in the ``/sys/class/net/#{iface}`` directory may be tested.
* On the |windows| platform, the ``Get-NetAdapter`` cmdlet returns the following values: ``Property Name``, ``InterfaceDescription``, ``Status``, ``State``, ``MacAddress``, ``LinkSpeed``, ``ReceiveLinkSpeed``, ``TransmitLinkSpeed``, and ``Virtual``, returned as a |json| object.

.. not sure the previous two bullet items are actually true, but keeping there for reference for now, just in case

Syntax -- DONE
-----------------------------------------------------
A ``interface`` InSpec resource block declares network interface properties to be tested. For example:

.. code-block:: ruby

   describe interface do
     it { should be_up }
     its(:speed) { should eq 1000 }
     its('name') { should eq eth0 }
   end

..
.. where
..
.. * ``xxxxx`` must specify xxxxx
.. * xxxxx
.. * ``xxxxx`` is a valid matcher for this InSpec resource
..

Matchers -- DONE
-----------------------------------------------------
This InSpec resource has the following matchers.

be_up -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``be_up`` matcher tests if the network interface is available. For example:

.. code-block:: ruby

   it { should be_up }

name -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``name`` matcher tests if the named network interface exists. For example:

.. code-block:: ruby

   its('name') { should eq eth0 }

speed -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``speed`` matcher tests the speed of the network interface, in MB/sec. For example:

.. code-block:: ruby

   its(:speed) { should eq 1000 }

..
.. Examples
.. -----------------------------------------------------
.. The following examples show how to use this InSpec resource in a recipe.
..
.. **xxxxx**
..
.. xxxxx
..
.. **xxxxx**
..
.. xxxxx
..



json -- DONE
=====================================================
Use the ``json`` InSpec resource to test data in a |json| file.

Syntax -- DONE
-----------------------------------------------------
A ``json`` InSpec resource block declares the data to be tested. For example:

.. code-block:: ruby

   describe json do
     its('name') { should eq 'foo' }
   end

where

* ``name`` is a configuration setting in a |json| file
* ``should eq 'foo'`` tests a value of ``name`` as read from a |json| file versus the value declared in the test

Matchers -- DONE
-----------------------------------------------------
This InSpec resource has the following matchers.

name -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``name`` matcher tests the value of ``name`` as read from a |json| file versus the value declared in the test. For example:

.. code-block:: ruby

   its('name') { should eq 'foo' }

Examples -- DONE
-----------------------------------------------------
The following examples show how to use this InSpec resource in a recipe.

**Test a cookbook version in a policyfile.lock.json file**

.. code-block:: ruby

   describe json('policyfile.lock.json') do
     its('cookbook_locks.omnibus.version') { should eq('2.2.0') }
   end



kernel_module
=====================================================
Use the ``kernel_module`` InSpec resource to xxxxx.

IN_PROGRESS



kernel_parameter
=====================================================
Use the ``kernel_parameter`` InSpec resource to xxxxx.

IN_PROGRESS



limits_conf
=====================================================
Use the ``limits_conf`` InSpec resource to xxxxx.

IN_PROGRESS



login_defs -- DONE
=====================================================
Use the ``login_defs`` InSpec resource to test configuration settings in the ``/etc/login.defs`` file. The ``logins.defs`` file defines site-specific configuration for the shadow password suite on |linux| and |unix| platforms, such as password expiration ranges, minimum/maximum values for automatic selection of user and group identifiers, or the method with which passwords are encrypted.

Syntax -- DONE
-----------------------------------------------------
A ``login_defs`` InSpec resource block declares the ``login.defs`` configuration data to be tested. For example:

.. code-block:: ruby

   describe login_defs do
     its('name') { should include('foo') }
   end

where

* ``name`` is a configuration setting in ``login.defs``
* ``{ should include('foo') }`` tests the value of ``name`` as read from ``login.defs`` versus the value declared in the test

Matchers -- DONE
-----------------------------------------------------
This InSpec resource has the following matchers.

name -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``name`` matcher tests the value of ``name`` as read from ``login.defs`` versus the value declared in the test. For example:

.. code-block:: ruby

   its('name') { should eq 'foo' }

Examples -- DONE
-----------------------------------------------------
The following examples show how to use this InSpec resource in a recipe.

**Test password expiration settings**

.. code-block:: ruby

   describe login_defs do
     its('PASS_MAX_DAYS') { should eq '180' }
     its('PASS_MIN_DAYS') { should eq '1' }
     its('PASS_MIN_LEN') { should eq '15' }
     its('PASS_WARN_AGE') { should eq '30' }
   end

**Test the encryption method**

.. code-block:: ruby

   describe login_defs do
     its('ENCRYPT_METHOD') { should eq 'SHA512' }
   end

**Test xxxxx** <<< what does this test?

.. code-block:: ruby

   describe login_def do
     its('UMASK') { should eq '077' }
     its('PASS_MAX_DAYS.to_i') { should be <= 90 }
   end



mysql
=====================================================
Use the ``mysql`` InSpec resource to xxxxx.

IN_PROGRESS



mysql_conf
=====================================================
Use the ``mysql_conf`` InSpec resource to xxxxx.


IN_PROGRESS



mysql_session
=====================================================
Use the ``mysql_session`` InSpec resource to xxxxx.

IN_PROGRESS


npm -- DONE
-----------------------------------------------------
Use the ``npm`` InSpec resource to test if a global |npm| package is installed. |npm| is the `the package manager for Javascript packages <https://docs.npmjs.com>`__, such as |bower| and |statsd|.

Syntax -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
A ``npm`` InSpec resource block declares a package and (optionally) a package version. For example:

.. code-block:: ruby

   describe gem('npm_package_name') do
     it { should be_installed }
   end

where

* ``('npm_package_name')`` must specify a |npm| package, such as ``'bower'`` or ``'statsd'``
* ``be_installed`` is a valid matcher for this InSpec resource

Matchers -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
This InSpec resource has the following matchers.

be_installed -- DONE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The ``be_installed`` matcher tests if the named |gem| package and package version (if specified) is installed. For example:

.. code-block:: ruby

   it { should be_installed }

version -- DONE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The ``version`` matcher tests if the named package version is on the system. For example:

.. code-block:: ruby

   its(:version) { should eq '1.2.3' }

Examples -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The following examples show how to use this InSpec resource in a test.

**Verify that bower is installed, with a specific version**

.. code-block:: ruby

   describe npm('bower') do
     it { should be_installed }
     its(:version) { should eq '1.4.1' }
   end

**Verify that statsd is not installed**

.. code-block:: ruby

   describe npm('statsd') do
     it { should_not be_installed }
   end


ntp_conf -- DONE
-----------------------------------------------------
Use the ``ntp_conf`` InSpec resource to test the synchronization settings defined in the ``ntp.conf`` file. This file is typically located at ``/etc/ntp.conf``.

Syntax -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
A ``ntp_conf`` InSpec resource block declares the synchronization settings that should be tested. For example:

.. code-block:: ruby

   describe ntp_conf('path') do
     its(:setting_name) { should eq 'value' }
   end

where

* ``'setting_name'`` is a synchronization setting defined in the ``ntp.conf`` file
* ``('path')`` is the non-default path to the ``ntp.conf`` file
* ``{ should eq 'value' }`` is the value that is expected

Matchers -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
This InSpec resource matches any service that is listed in the ``ntp.conf`` file. For example:

.. code-block:: ruby

     its('server') { should_not eq nil }

or:

.. code-block:: ruby

     its('restrict') { should include '-4 default kod notrap nomodify nopeer noquery'}

For example:

.. code-block:: ruby

   describe ntp_conf do
     its('server') { should_not eq nil }
     its('restrict') { should include '-4 default kod notrap nomodify nopeer noquery'}
   end

Examples -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The following examples show how to use this InSpec resource in a test.

..
.. **xxxxx**
..
.. xxxxx
..
.. **xxxxx**
..
.. xxxxx
..



oneget -- DONE
-----------------------------------------------------
Use the ``oneget`` InSpec resource to test if the named package and/or package version is installed on the system. This resource uses |oneget|, which is `part of the Windows Management Framework 5.0 and Windows 10 <https://github.com/OneGet/oneget>`__. This resource uses the ``Get-Package`` cmdlet to return all of the package names in the |oneget| repository.

Syntax -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
A ``oneget`` InSpec resource block declares a package and (optionally) a package version. For example:

.. code-block:: ruby

   describe oneget('name') do
     it { should be_installed }
   end

where

* ``('name')`` must specify the name of a package, such as ``'VLC'``
* ``be_installed`` is a valid matcher for this InSpec resource

Matchers -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
This InSpec resource has the following matchers.

be_installed -- DONE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The ``be_installed`` matcher tests if the named package is installed on the system. For example:

.. code-block:: ruby

   it { should be_installed }

version -- DONE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The ``version`` matcher tests if the named package version is on the system. For example:

.. code-block:: ruby

   its(:version) { should eq '1.2.3' }

Examples -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The following examples show how to use this InSpec resource in a test.

**Test if VLC is installed**

.. code-block:: ruby

   describe package('VLC') do
     it { should be_installed }
   end




os -- DONE
-----------------------------------------------------
Use the ``os`` InSpec resource to test the platform on which the system is running.

Syntax -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
A ``os`` InSpec resource block declares the platform to be tested. For example:

.. code-block:: ruby

   describe os do
     it { should eq 'platform' }
   end

where

* ``'platform'`` is one of ``bsd``, ``debian``, ``linux``, ``redhat``, ``solaris``, ``suse``,  ``unix``, or ``windows``

Matchers -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
This InSpec resource does not have any matchers.

Examples -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The following examples show how to use this InSpec resource in a test.

**Test for RedHat**

.. code-block:: ruby

   describe os do
     it { should eq 'redhat' }
   end

**Test for Ubuntu**

.. code-block:: ruby

   describe os do
     it { should eq 'debian' }
   end

**Test for Microsoft Windows**

.. code-block:: ruby

   describe os do
     it { should eq 'windows' }
   end




os_env -- DONE
-----------------------------------------------------
Use the ``os_env`` InSpec resource to test the environment variables for the platform on which the system is running.

Syntax -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
A ``os_env`` InSpec resource block declares xxxxx. For example:

.. code-block:: ruby

   describe os_env('VARIABLE') do
     its('matcher') { should eq 1 }
   end

where

* ``('VARIABLE')`` must specify an environment variable, such as ``PATH``
* ``matcher`` is a valid matcher for this InSpec resource

Matchers -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
This InSpec resource has the following matchers.

exit_status -- DONE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The ``exit_status`` matcher tests the exit status of the platform environment. For example:

.. code-block:: ruby

   its(:exit_status) { should eq 0 }

split -- DONE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The ``split`` matcher tests the delimiter between environment variables. For example:

.. code-block:: ruby

   its(:split) { should include ('') }

or:

.. code-block:: ruby

   its(:split) { should_not include ('.') }

Use ``-1`` to test for cases where there is a trailing colon (``:``), such as ``dir1::dir2:``:

.. code-block:: ruby

   its(:split) { should include ('-1') }

stderr -- DONE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The ``stderr`` matcher tests environment variables after they are output to stderr. For example:

.. code-block:: ruby

   its(:stderr) { should include('PWD=/root') }

Examples -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The following examples show how to use this InSpec resource in a test.

**Test the PATH environment variable**

.. code-block:: ruby

   describe os_env('PATH') do |dirs|
     its(:split) { should_not include('') }
     its(:split) { should_not include('.') }
   end




package -- DONE
-----------------------------------------------------
Use the ``package`` InSpec resource to test if the named package and/or package version is installed on the system.

Syntax -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
A ``package`` InSpec resource block declares a package and (optionally) a package version. For example:

.. code-block:: ruby

   describe package('name') do
     it { should be_installed }
   end

where

* ``('name')`` must specify the name of a package, such as ``'nginx'``
* ``be_installed`` is a valid matcher for this InSpec resource

Matchers -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
This InSpec resource has the following matchers.

be_installed -- DONE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The ``be_installed`` matcher tests if the named package is installed on the system. For example:

.. code-block:: ruby

   it { should be_installed }

version -- DONE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The ``version`` matcher tests if the named package version is on the system. For example:

.. code-block:: ruby

   its(:version) { should eq '1.2.3' }

Examples -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The following examples show how to use this InSpec resource in a test.

**Test if nginx version 1.9.5 is installed**

.. code-block:: ruby

   describe package('nginx') do
     it { should be_installed }
     its(:version) { should eq 1.9.5 }
   end

**Test that a package is not installed**

.. code-block:: ruby

   describe package('some_package') do
     it { should_not be_installed }
   end

**Test if telnet is installed**

.. code-block:: ruby

   describe package('telnetd') do
     it { should_not be_installed }
   end

   describe inetd_conf do
     its('telnet') { should eq nil }
   end

**Test if ClamAV (an antivirus engine) is installed and running**

.. code-block:: ruby

   describe package('clamav') do
     it { should be_installed }
     its('version') { should eq '0.98.7' }
   end

   describe service('clamd') do
     it { should_not be_enabled }
     it { should_not be_installed }
     it { should_not be_running }
   end



parse_config -- DONE
-----------------------------------------------------
Use the ``parse_config`` InSpec resource to test arbitrary configuration files, such as testing the results of a regular expression, ensuring that settings are commented out, testing for multiple values, and so on.

Syntax -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
A ``parse_config`` InSpec resource block declares the location of the configuration file to be tested, and then which settings in that file are to be tested. Because this InSpec resource relies on arbitrary configuration files, the test itself is often arbitrary and relies on custom |ruby| code. For example:

.. code-block:: ruby

   output = command('some-command').stdout

   describe parse_config(output, { data_config_option: value } ) do
     its('setting') { should eq 1 }
   end

or:

.. code-block:: ruby

   audit = command('/sbin/auditctl -l').stdout
     options = {
       assignment_re: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
       multiple_values: true
     }

   describe parse_config(audit, options) do
     its('setting') { should eq 1 }
   end

where each test

* Must declare the location of the configuration file to be tested
* Must declare one (or more) settings to be tested
* May run a command to ``stdout``, and then run the test against that output
* May use options to define how configuration data is to be parsed

Options -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
This InSpec resource supports the following options for parsing configuration data. Use them in an ``options`` block stated outside of (and immediately before) the actual test. For example:

.. code-block:: ruby

   options = {
       assignment_re: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
       multiple_values: true
     }
   describe parse_config(options) do
     its('setting') { should eq 1 }
   end

assignment_re -- DONE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Use ``assignment_re`` to test a key value using a regular expression. For example:

.. code-block:: ruby

   'key = value'

may be tested using the following regular expression, which determines assignment from key to value:

.. code-block:: ruby

   assignment_re: /^\s*([^=]*?)\s*=\s*(.*?)\s*$/

comment_char -- DONE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Use ``comment_char`` to test for comments in a configuration file. For example:

.. code-block:: ruby

   comment_char: '#'

key_vals -- DONE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Use ``key_vals`` to test how many values a key contains. For example:

.. code-block:: ruby

   key = a b c

contains three values. To test that value to ensure it only contains one, use:

.. code-block:: ruby

   key_vals: 1

multiple_values -- DONE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Use ``multiple_values`` to test for the presence of multiple key values. For example:

.. code-block:: ruby

   'key = a' and 'key = b'
   params['key'] = ['a', 'b']

or:

.. code-block:: ruby

   'key = a' and 'key = b'
   params['key'] = 'b'

To test if multiple values are present, use:

.. code-block:: ruby

   multiple_values: false

The preceding test will fail with the first example and will pass with the second.

standalone_comments -- DONE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Use ``standalone_comments`` to test for comments in a configuration file and to ensure they are not integrated into the same lines as code. For example:

.. code-block:: ruby

   'key = value # comment'
   params['key'] = 'value'

or:

.. code-block:: ruby

   'key = value # comment'
   params['key'] = 'value # comment'

To test if comments are standalone, use:

.. code-block:: ruby

   standalone_comments: true

The preceding test will fail with the second example and will pass with the first.

Examples -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The following examples show how to use this InSpec resource in a test.

**Test the expiration time for new account passwords**

.. code-block:: ruby

   output = command('useradd -D').stdout

   describe parse_config(output) do
     its('INACTIVE.to_i') { should be >= 35 }
   end

**Test that bob is a user**

.. code-block:: ruby

   describe parse_config(data, { multiple_values: true }) do
     its('users') { should include 'bob'}
   end



parse_config_file -- DONE
-----------------------------------------------------
Use the ``parse_config_file`` InSpec resource to test arbitrary configuration files.

Syntax -- DONE (is this really "identical" to the parse_config syntax?)
+++++++++++++++++++++++++++++++++++++++++++++++++++++
A ``parse_config_file`` InSpec resource block declares the location of the configuration file to be tested, and then which settings in that file are to be tested. Because this InSpec resource relies on arbitrary configuration files, the test itself is often arbitrary and relies on custom |ruby| code. For example:

.. code-block:: ruby

   output = command('some-command').stdout

   describe parse_config_file(output, { data_config_option: value } ) do
     its('setting') { should eq 1 }
   end

or:

.. code-block:: ruby

   audit = command('/sbin/auditctl -l').stdout
     options = {
       assignment_re: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
       multiple_values: true
     }

   describe parse_config_file(audit, options) do
     its('setting') { should eq 1 }
   end

where each test

* Must declare the location of the configuration file to be tested
* Must declare one (or more) settings to be tested
* May run a command to ``stdout``, and then run the test against that output
* May use options to define how configuration data is to be parsed

.. or is this one more like this?

.. code-block:: ruby

   audit = command('/sbin/auditctl -l').stdout
     options = {
       assignment_re: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
       multiple_values: true
     }

   describe parse_config_file(audit, options) do
     its('setting') { should eq 1 }
   end

where each test

* Must declare the location of the configuration file to be tested
* Must declare one (or more) settings to be tested
* May run a command to ``stdout``, and then run the test against that output
* May use options to define how configuration data is to be parsed

Options -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
This InSpec resource supports the following options for parsing configuration data. Use them in an ``options`` block stated outside of (and immediately before) the actual test. For example:

.. code-block:: ruby

   describe parse_config_file(/path/to/config/file) do
     its('setting') { should eq 1 }
   end

InSpec == inspec (command-line)

assignment_re -- DONE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
IDENTICAL TO parse_config << INCLUDE THEM IN BOTH SPOTS WHEN PUBLISHED

comment_char -- DONE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
IDENTICAL TO parse_config << INCLUDE THEM IN BOTH SPOTS WHEN PUBLISHED

key_vals -- DONE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
IDENTICAL TO parse_config << INCLUDE THEM IN BOTH SPOTS WHEN PUBLISHED

multiple_values -- DONE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
IDENTICAL TO parse_config << INCLUDE THEM IN BOTH SPOTS WHEN PUBLISHED

standalone_comments -- DONE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
IDENTICAL TO parse_config << INCLUDE THEM IN BOTH SPOTS WHEN PUBLISHED

Examples -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The following examples show how to use this InSpec resource in a test.

**Test a configuration setting**

.. code-block:: ruby

   describe parse_config_file('/path/to/file.conf') do
    its('PARAM_X') { should eq 'Y' }
   end

**Use options, and then test a configuration setting**

.. code-block:: ruby

   describe parse_config_file('/path/to/file.conf', { multiple_values: true }) do
    its('PARAM_X') { should include 'Y' }
   end





passwd -- DONE
=====================================================
Use the ``passwd`` InSpec resource to test the contents of ``/etc/passwd``, which contains the following information for users that may log into the system and/or as users that own running processes. The format for ``/etc/passwd`` includes:

* A username
* The password for that user
* The user identifier (UID) assigned to that user
* The group identifier (GID) assigned to that user
* Additional information about that user
* That user's home directory
* That user's default command shell

defined as a colon-delimited row in the file, one row per user. For example:

.. code-block:: bash

   root:x:1234:5678:additional_info:/home/dir/:/bin/bash

Syntax -- DONE
-----------------------------------------------------
A ``passwd`` InSpec resource block declares one (or more) users and associated user information to be tested. For example:

.. code-block:: ruby

   describe passwd do
     its(:matcher) { should eq 0 }
   end

where

* ``count``, ``gids``, ``passwords``, ``uid``, ``uids``, ``username``, ``usernames``, and ``users`` are valid matchers for this InSpec resource

Matchers -- DONE
-----------------------------------------------------
This InSpec resource has the following matchers.

count -- ?????
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``count`` matcher tests if xxxxx. For example:

.. code-block:: ruby

   its(:count) { should eq 1 }

gids -- ?????
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``gids`` matcher tests if xxxxx. For example:

.. code-block:: ruby

   its(:gids) { should eq 1234 }

passwords -- ?????
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``passwords`` matcher tests if xxxxx. For example:

.. code-block:: ruby

   its(:passwords) { should eq xxxxx }

uid -- ?????
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``uid`` matcher tests if xxxxx. For example:

.. code-block:: ruby

   its(:uid) { should eq xxxxx }

uids -- ?????
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``uids`` matcher tests if xxxxx. For example:

.. code-block:: ruby

   its(:uids) { should eq 1 }

username -- ?????
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``username`` matcher tests if xxxxx. For example:

.. code-block:: ruby

   its(:username) { should eq 'root' }

usernames -- ?????
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``usernames`` matcher tests if xxxxx. For example:

.. code-block:: ruby

   its(:usernames) { should eq 'root' }

users -- ?????
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``users`` matcher tests if xxxxx. For example:

.. code-block:: ruby

   its(:users) { should eq 'root' }

Examples -- DONE
-----------------------------------------------------
The following examples show how to use this InSpec resource in a recipe.

**xxxxx**

.. code-block:: ruby

   describe passwd do
     its(:usernames) { should eq 'root' }
     its(:uids) { should eq 1 }
   end

**xxxxx**

.. code-block:: ruby

   describe passwd.uid(0) do
     its(:username) { should eq 'root' }
     its(:count) { should eq 1 }
   end



pip -- DONE
=====================================================
Use the ``pip`` InSpec resource to test packages that are installed using the |pip| installer.

Syntax -- DONE
-----------------------------------------------------
A ``pip`` InSpec resource block declares a package and (optionally) a package version. For example:

.. code-block:: ruby

   describe pip('Jinja2') do
     it { should be_installed }
   end

where

* ``'Jinja2'`` is the name of the package
* ``be_installed`` tests to see if the ``Jinja2`` package is installed

Matchers -- DONE
-----------------------------------------------------
This InSpec resource has the following matchers.

be_installed -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``be_installed`` matcher tests if the named package is installed on the system. For example:

.. code-block:: ruby

   it { should be_installed }

version -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``version`` matcher tests if the named package version is on the system. For example:

.. code-block:: ruby

   its(:version) { should eq 1.2.3 }

Examples -- DONE
-----------------------------------------------------
The following examples show how to use this InSpec resource in a recipe.

**Test if Jinja2 is installed on the system**

.. code-block:: ruby

   describe pip('Jinja2') do
     it { should be_installed }
   end

**Test if Jinja2 2.8 is installed on the system**

.. code-block:: ruby

   describe pip('Jinja2') do
     it { should be_installed }
     its(:version) { should eq '2.8' }
   end


port -- DONE
=====================================================
Use the ``port`` InSpec resource to test basic port properties, such as port, process, if it's listening.

Syntax -- DONE
-----------------------------------------------------
A ``port`` InSpec resource block declares a port, and then depending on what needs to be tested, a process, protocol, process identifier, and its state (is it listening?). For example:

.. code-block:: ruby

   describe port(514) do
     it { should be_listening }
     its(:process) {should eq 'syslog'}
   end

where the ``syslog`` process is tested to see if it's listening on port 514.

Matchers -- DONE
-----------------------------------------------------
This InSpec resource has the following matchers.

be_listening -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``be_listening`` matcher tests if the port is listening for traffic. For example:

.. code-block:: ruby

   it { should be_listening }

be_listening.with() -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``be_listening`` matcher can also test if the port is listening for traffic over a specific protocol or on local binding address. Use ``.with()`` to specify a protocol or local binding address. For example, a protocol:

.. code-block:: ruby

   it { should be_listening.with('tcp') }

A local binding address:

   it { should be_listening.with('127.0.0.1:631') }

A protocol and a local binding address:

   it { should be_listening.with('tcp', '127.0.0.1:631') }

pid -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``pid`` matcher tests the process identifier (PID). For example:

.. code-block:: ruby

   its(:pid) { should eq '27808' }

process -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``process`` matcher tests if the named process is running on the system. For example:

.. code-block:: ruby

   its(:process) { should eq 'syslog' }

protocol -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``protocol`` matcher tests the Internet protocol: |icmp| (``'icmp'``), |tcp| (``'tcp'`` or ``'tcp6'``), or |udp| (``'udp'`` or ``'udp6'``). For example:

.. code-block:: ruby

   its(:protocol) { should eq 'tcp' }

or for the |ipv6| protocol:

.. code-block:: ruby

   its(:protocol) { should eq 'tcp6' }

Examples -- DONE
-----------------------------------------------------
The following examples show how to use this InSpec resource in a recipe.

**Test port 80, listening with the TCP protocol**

.. code-block:: ruby

   describe port(80) do
     it { should be_listening }
     its('protocol') {should eq 'tcp'}
   end

**Test port 80, listening with TCP version IPv6 protocol**

.. code-block:: ruby

   describe port(80) do
     it { should be_listening }
     its('protocol') {should eq 'tcp6'}
   end

**Test ports for SSL, then verify ciphers**

.. code-block:: ruby

   describe port(80) do
     it { should_not be_listening }
   end

   describe port(443) do
     it { should be_listening }
     its('protocol') {should eq 'tcp'}
   end

   describe sshd_conf do
     its('Ciphers') { should eq('chacha20-poly1305@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr') }
   end



postgres -- NOT AN AUDIT RESOURCE?
=====================================================
TBD

.. This one seems like it's just loading some postgresql information on behalf of the postgres_conf and postgres_session InSpec resources. Right?


postgres_conf -- DONE
=====================================================
Use the ``postgres_conf`` InSpec resource to test the contents of the configuration file for |postgresql|, typically located at ``/etc/postgresql/<version>/main/postgresql.conf`` or ``/var/lib/postgres/data/postgresql.conf``, depending on the platform.

Syntax -- DONE
-----------------------------------------------------
A ``postgres_conf`` InSpec resource block declares one (or more) settings in the ``postgresql.conf`` file, and then compares the setting in the configuration file to the value stated in the test. For example:

.. code-block:: ruby

   describe postgres_conf('path') do
     its('setting') { should eq 'value' }
   end

where

* ``'setting'`` specifies a setting in the ``postgresql.conf`` file
* ``('path')`` is the non-default path to the ``postgresql.conf`` file
* ``should eq 'value'`` is the value that is expected

Matchers -- DONE
-----------------------------------------------------
This InSpec resource has the following matchers.

setting -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``setting`` matcher tests specific, named settings in the ``postgresql.conf`` file. For example:

.. code-block:: ruby

   its('setting') { should eq 'value' }

Use a ``setting`` matcher for each setting to be tested.

Examples -- DONE
-----------------------------------------------------
The following examples show how to use this InSpec resource in a recipe.

**Test the maximum number of allowed client connections**

.. code-block:: ruby

   describe postgres_conf do
     its('max_connections') { should eq '5' }
   end

**Test system logging**

.. code-block:: ruby

   describe postgres_conf do
     its('logging_collector') { should eq 'on' }
     its('log_connections') { should eq 'on' }
     its('log_disconnections') { should eq 'on' }
     its('log_duration') { should eq 'on' }
     its('log_hostname') { should eq 'on' }
     its('log_line_prefix') { should eq '%t %u %d %h' }
   end

**Test the port on which PostgreSQL listens**

.. code-block:: ruby

   describe postgres_conf do
     its('port') { should eq '5432' }
   end

**Test the Unix socket settings**

.. code-block:: ruby

   describe postgres_conf do
     its('unix_socket_directories') { should eq '.s.PGSQL.5432' }
     its('unix_socket_group') { should eq nil }
     its('unix_socket_permissions') { should eq '0770' }
   end

where ``unix_socket_group`` is set to the |postgresql| default setting (the group to which the server user belongs).



postgres_session -- DONE
=====================================================
Use the ``postgres_session`` InSpec resource to test SQL commands run against a |postgresql| database.

Syntax -- DONE
-----------------------------------------------------
A ``postgres_session`` InSpec resource block declares the username and password to use for the session, and then the command to be run. For example:

.. code-block:: ruby

   sql = postgres_session('username', 'password')

   sql.describe('SELECT * FROM pg_shadow WHERE passwd IS NULL;') do
     its('output') { should eq('') }
   end

where

* ``sql = postgres_session`` declares a username and password with permission to run the query
* ``describe('')`` contains the query to be run
* ``its('output') { should eq('') }`` compares the results of the query against the expected result in the test

Matchers -- DONE
-----------------------------------------------------
This InSpec resource has the following matchers.

output -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``output`` matcher tests the results of the query. For example:

.. code-block:: ruby

   its(:output) { should eq(/^0/) }

Examples -- DONE
-----------------------------------------------------
The following examples show how to use this InSpec resource in a recipe.

**Test the PostgreSQL shadow password**

.. code-block:: ruby

   sql = postgres_session('my_user', 'password')

   sql.describe('SELECT * FROM pg_shadow WHERE passwd IS NULL;') do
     its(:output) { should eq('') }
   end

**Test for risky database entries**

.. code-block:: ruby

   sql = postgres_session('my_user', 'password')

   sql.describe('SELECT count (*)
                 FROM pg_language
                 WHERE lanpltrusted = 'f'
                 AND lanname!='internal'
                 AND lanname!='c';') do
     its(:output) { should eq(/^0/) }
   end



processes -- DONE
=====================================================
Use the ``processes`` InSpec resource to test properties for running programs a system.

Syntax -- DONE
-----------------------------------------------------
A ``processes`` InSpec resource block declares the name of the process to be tested, and then declares one (or more) property/value pairs. For example:

.. code-block:: ruby

   describe processes('process_name') do
     its('property_name') { should eq 'property_value' }
   end

where

* ``processes('process_name')`` must specify the name of a process that is running on the system
* Multiple properties may be tested; for each property to be tested, use an ``its('property_name')`` statement

Matchers -- DONE
-----------------------------------------------------
This InSpec resource has the following matchers.

property_name -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``property_name`` matcher tests the named property for the specified value. For example:

.. code-block:: ruby

   its('property_name') { should eq 'property_value' }

Examples -- DONE
-----------------------------------------------------
The following examples show how to use this InSpec resource in a recipe.

**Test if the list length for the mysqld process is 1**

.. code-block:: ruby

   describe processes('mysqld') do
     its('list.length') { should eq '1' }
   end

**Test if the init process is owned by the root user**

.. code-block:: ruby

   describe processes('init') do
     its('user') { should eq 'root' }
   end

**Test if a high-priority process is running**

.. code-block:: ruby

   describe processes('some_process') do
     its('state') { should eq 'R<' }
   end


registry_key -- DONE
=====================================================
Use the ``registry_key`` InSpec resource to test key values in the |windows| registry.

Syntax -- DONE
-----------------------------------------------------
A ``registry_key`` InSpec resource block declares the item in the |windows| registry, the path to a setting under that item, and then one (or more) name/value pairs to be tested. For example:

.. code-block:: ruby

   describe registry_key('registry_item', 'path\to\key') do
     its('name') { should eq 'value' }
   end

where

* ``'registry_item'`` is a key in the |windows| registry
* ``'path\to\key'`` is the path in the |windows| registry
* ``('name')`` and ``'value'`` represent the name of the key and the value assigned to that key

Matchers -- DONE
-----------------------------------------------------
This InSpec resource has the following matchers.

name -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``name`` matcher tests the value for the specified registry setting. For example:

.. code-block:: ruby

   its('name') { should eq 'value' }

Examples -- DONE
-----------------------------------------------------
The following examples show how to use this InSpec resource in a recipe.

**Test the start time for the Schedule service**

.. code-block:: ruby

   describe registry_key('Task Scheduler','HKEY_LOCAL_MACHINE\...\Schedule') do
     its('Start') { should eq 2 }
   end

where ``'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Schedule'`` is the full path to the setting.


script -- DONE
=====================================================
Use the ``script`` InSpec resource to test a |powershell| script on the |windows| platform.

.. this one is a bit of a wild guess.

Syntax -- DONE
-----------------------------------------------------
A ``script`` InSpec resource block declares xxxxx. For example:

.. code-block:: ruby

   describe script do
     its('script_name') { should include 'total_wild_guess' }
   end

..
.. where
..
.. * ``xxxxx`` must specify xxxxx
.. * xxxxx
.. * ``xxxxx`` is a valid matcher for this InSpec resource
..

Matchers -- DONE
-----------------------------------------------------
This InSpec resource has the following matchers.

script_name -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``script_name`` matcher tests the named script against the value specified by the test. For example:

.. code-block:: ruby

   its('script_name') { should include 'total_wild_guess' }

Examples -- DONE
-----------------------------------------------------
The following examples show how to use this InSpec resource in a recipe.

.. stoopid test below; probably need a better one

**Test that user Grantmc belongs to the Active Directory object**

.. code-block:: ruby

   describe script do
     its('ADObject') { should include 'Get-ADPermission -Identity Grantmc' }
   end

..
.. **xxxxx**
..
.. xxxxx
..


security_policy -- DONE
=====================================================
Use the ``security_policy`` InSpec resource to test security policies on the |windows| platform.

Syntax -- DONE
-----------------------------------------------------
A ``security_policy`` InSpec resource block declares the name of a security policy and the value to be tested. For example:

.. code-block:: ruby

   describe security_policy do
     its('policy_name') { should eq 'value' }
   end

where

* ``'policy_name'`` must specify a security policy
* ``{ should eq 'value' }`` tests the value of ``policy_name`` against the value declared in the test

Matchers -- DONE
-----------------------------------------------------
This InSpec resource has the following matchers.

policy_name -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``policy_name`` matcher must be the name of a security policy. For example:

.. code-block:: ruby

   its('SeNetworkLogonRight') { should eq '*S-1-5-11' }

Examples -- DONE
-----------------------------------------------------
The following examples show how to use this InSpec resource in a recipe.

**Verify that only the Administrators group has remote access**

.. code-block:: ruby

   describe security_policy do
     its('SeRemoteInteractiveLogonRight') { should eq '*S-1-5-32-544' }
   end


service -- DONE
=====================================================
Use the ``service`` InSpec resource to test if the named service is installed, running and/or enabled.

Syntax -- DONE
-----------------------------------------------------
A ``service`` InSpec resource block declares the name of a service and then one (or more) matchers to test the state of the service. For example:

.. code-block:: ruby

   describe service('service_name') do
     it { should be_installed }
     it { should be_enabled }
     it { should be_running }
   end

where

* ``('service_name')`` must specify a service name
* ``be_installed``, ``be_enabled``, and ``be_running`` are valid matchers for this InSpec resource


Matchers -- DONE
-----------------------------------------------------
This InSpec resource has the following matchers.

be_enabled -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``be_enabled`` matcher tests if the named service is enabled. For example:

.. code-block:: ruby

   it { should be_enabled }

be_installed -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``be_installed`` matcher tests if the named service is installed. For example:

.. code-block:: ruby

   it { should be_installed }

be_running -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``be_running`` matcher tests if the named service is running. For example:

.. code-block:: ruby

   it { should be_running }

Examples -- DONE
-----------------------------------------------------
The following examples show how to use this InSpec resource in a recipe.

**Test if the postgresql service is both running and enabled**

.. code-block:: ruby

   describe service('postgresql') do
     it { should be_enabled }
     it { should be_running }
   end

**Test if the mysql service is both running and enabled**

.. code-block:: ruby

   describe service('mysqld') do
     it { should be_enabled }
     it { should be_running }
   end

**Test if ClamAV (an antivirus engine) is installed and running**

.. code-block:: ruby

   describe package('clamav') do
     it { should be_installed }
     its('version') { should eq '0.98.7' }
   end

   describe service('clamd') do
     it { should_not be_enabled }
     it { should_not be_installed }
     it { should_not be_running }
   end


ssh_config -- DONE
=====================================================
Use the ``ssh_config`` InSpec resource to test |openssh| |ssh| client configuration data located at ``etc/ssh/ssh_config`` on |linux| and |unix| platforms.

Syntax -- DONE
-----------------------------------------------------
A ``ssh_config`` InSpec resource block declares the client |openssh| configuration data to be tested. For example:

.. code-block:: ruby

   describe ssh_config('path') do
     its('name') { should include('foo') }
   end

where

* ``name`` is a configuration setting in ``ssh_config``
* ``('path')`` is the non-default ``/path/to/ssh_config``
* ``{ should include('foo') }`` tests the value of ``name`` as read from ``ssh_config`` versus the value declared in the test

Matchers -- DONE
-----------------------------------------------------
This InSpec resource has the following matchers.

name -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``name`` matcher tests the value of ``name`` as read from ``ssh_config`` versus the value declared in the test. For example:

.. code-block:: ruby

   its('name') { should eq 'foo' }

or:

.. code-block:: ruby

   it's('name') { should include('bar') }

Examples -- DONE
-----------------------------------------------------
The following examples show how to use this InSpec resource in a recipe.

**Test SSH configuration settings**

.. code-block:: ruby

   describe ssh_config do
     its('cipher') { should eq '3des' }
     its('port') { should '22' }
     its('hostname') { should include('example.com') }
   end

**Test which variables from the local environment are sent to the server**

.. code-block:: ruby

   return unless command('ssh').exist?

   describe ssh_config do
     its('SendEnv') { should include('GORDON_CLIENT') }
   end

**Test owner and group permissions**

.. code-block:: ruby

  describe ssh_config do
    its('owner') { should eq 'root' }
    its('mode') { should eq 644 }
  end


sshd_config -- DONE
=====================================================
Use the ``sshd_config`` InSpec resource to test configuration data for the |openssh| daemon located at ``etc/ssh/sshd_config`` on |linux| and |unix| platforms. sshd---the |openssh| daemon---listens on dedicated ports, starts a daemon for each incoming connection, and then handles encryption, authentication, key exchanges, command executation, and data exchanges.

Syntax -- DONE
-----------------------------------------------------
A ``sshd_config`` InSpec resource block declares the client |openssh| configuration data to be tested. For example:

.. code-block:: ruby

   describe sshd_config('path') do
     its('name') { should include('foo') }
   end

where

* ``name`` is a configuration setting in ``sshd_config``
* ``('path')`` is the non-default ``/path/to/sshd_config``
* ``{ should include('foo') }`` tests the value of ``name`` as read from ``ssh_config`` versus the value declared in the test

Matchers -- DONE
-----------------------------------------------------
This InSpec resource has the following matchers.

name -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``name`` matcher tests the value of ``name`` as read from ``sshd_config`` versus the value declared in the test. For example:

.. code-block:: ruby

   its('name') { should eq 'foo' }

or:

.. code-block:: ruby

   it's('name') {should include('bar') }

Examples -- DONE
-----------------------------------------------------
The following examples show how to use this InSpec resource in a recipe.

**Test which variables may be sent to the server**

.. code-block:: ruby

   return unless command('sshd').exist?

   describe sshd_config do
     its('AcceptEnv') { should include('GORDON_SERVER') }
   end

**Test for IPv6-only addresses**

.. code-block:: ruby

   return unless command('sshd').exist?

   describe sshd_config do
     its('AddressFamily') { should eq 'inet6' }
   end

**Test protocols**

.. code-block:: ruby

   describe sshd_config do
     its('Protocol') { should eq '2' }
   end

**Test ports for SSL, then verify ciphers**

.. code-block:: ruby

   describe port(80) do
     it { should_not be_listening }
   end

   describe port(443) do
     it { should be_listening }
     its('protocol') {should eq 'tcp'}
   end

   describe sshd_conf do
     its('Ciphers') { should eq('chacha20-poly1305@openssh.com,aes256-ctr,aes192-ctr,aes128-ctr') }
   end


user -- DONE
=====================================================
Use the ``user`` InSpec resource to test user profiles, including the groups to which they belong, the frequency of required password changes, the directory paths to home and shell.

Syntax -- DONE
-----------------------------------------------------
A ``user`` InSpec resource block declares a user name, and then one (or more) matchers. For example:

.. code-block:: ruby

   describe user('root') do
     it { should exist }
     its('uid') { should eq 1234 }
     its('gid') { should eq 1234 }
     its('group') { should eq 'root' }
     its('groups') { should eq ['root', 'other']}
     its('home') { should eq '/root' }
     its('shell') { should eq '/bin/bash' }
     its('mindays') { should eq 0 }
     its('maxdays') { should eq 90 }
     its('warndays') { should eq 8 }
   end

where

* ``('root')`` is the user to be tested
* ``it { should exist }`` tests if the user exists
* ``gid``, ``group``, ``groups``, ``home``, ``maxdays``, ``mindays``, ``shell``, ``uid``, and ``warndays`` are valid matchers for this InSpec resource

Matchers -- DONE
-----------------------------------------------------
This InSpec resource has the following matchers.

exist -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``exist`` matcher tests if the named user exists. For example:

.. code-block:: ruby

   it { should exist }

gid -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``gid`` matcher tests the group identifier. For example:

.. code-block:: ruby

   its('gid') { should eq 1234 } }

where ``1234`` represents the user identifier.

group -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``group`` matcher tests the group to which the user belongs. For example:

.. code-block:: ruby

   its('group') { should eq 'root' }

where ``root`` represents the group.

groups -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``groups`` matcher tests two (or more) groups to which the user belongs. For example:

.. code-block:: ruby

   its('groups') { should eq ['root', 'other']}

home -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``home`` matcher tests the home directory path for the user. For example:

.. code-block:: ruby

   its('home') { should eq '/root' }

maxdays -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``maxdays`` matcher tests the maximum number of days between password changes. For example:

.. code-block:: ruby

   its('maxdays') { should eq 99 }

where ``99`` represents the maximum number of days.

mindays -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``mindays`` matcher tests the minimum number of days between password changes. For example:

.. code-block:: ruby

   its('mindays') { should eq 0 }

where ``0`` represents the maximum number of days.

shell -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``shell`` matcher tests the path to the default shell for the user. For example:

.. code-block:: ruby

   its('shell') { should eq '/bin/bash' }

uid -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``uid`` matcher tests the user identifier. For example:

.. code-block:: ruby

   its('uid') { should eq 1234 } }

where ``1234`` represents the user identifier.

warndays -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``warndays`` matcher tests the number of days a user is warned before a password must be changed. For example:

.. code-block:: ruby

   its('warndays') { should eq 5 }

where ``5`` represents the number of days a user is warned.

Examples -- DONE
-----------------------------------------------------
The following examples show how to use this InSpec resource in a recipe.

**Verify available users for the MySQL server**

.. code-block:: ruby

   describe user('root') do
     it { should exist }
     it { should belong_to_group 'root' }
     its('uid') { should eq 0 }
     its('groups') { should eq ['root'] }
   end

   describe user('mysql') do
    it { should_not exist }
   end


windows_feature -- DONE
=====================================================
Use the ``windows_feature`` InSpec resource to test features on |windows|. The ``Get-WindowsFeature`` cmdlet returns the following values: ``Property Name``, ``DisplayName``, ``Description``, ``Installed``, and ``InstallState``, returned as a |json| object similar to:

.. code-block:: javascript

   {
     "Name": "XPS-Viewer",
     "DisplayName": "XPS Viewer",
     "Description": "The XPS Viewer reads, sets permissions, and digitally signs XPS documents.",
     "Installed": false,
     "InstallState": 0
   }

Syntax -- DONE
-----------------------------------------------------
A ``windows_feature`` InSpec resource block declares the name of the |windows| feature, tests if that feature is installed, and then returns information about that feature. For example:

.. code-block:: ruby

   describe windows_feature('feature_name') do
     it { should be_installed }
   end

where

* ``('feature_name')`` must specify a |windows| feature name, such as ``DHCP Server`` or ``IIS-Webserver``
* ``be_installed`` is a valid matcher for this InSpec resource

Matchers -- DONE
-----------------------------------------------------
This InSpec resource has the following matchers.

be_installed -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``be_installed`` matcher tests if the named |windows| feature is installed. For example:

.. code-block:: ruby

   it { should be_installed }

If the feature is installed, the ``Get-WindowsFeature`` cmdlet is run and the name, display name, description, and install state is returned as a |json| object.

Examples -- DONE
-----------------------------------------------------
The following examples show how to use this InSpec resource in a recipe.

**Test the DHCP Server feature **

.. code-block:: ruby

   describe windows_feature('DHCP Server') do
     it{ should be_installed }
   end


yaml -- DONE
=====================================================
Use the ``yaml`` InSpec resource to test configuration data in a |yaml| file.

Syntax -- DONE
-----------------------------------------------------
A ``yaml`` InSpec resource block declares the configuration data to be tested. For example:

.. code-block:: ruby

   describe yaml do
     its('name') { should eq 'foo' }
   end

where

* ``name`` is a configuration setting in a |yaml| file
* ``should eq 'foo'`` tests a value of ``name`` as read from a |yaml| file versus the value declared in the test

Matchers -- DONE
-----------------------------------------------------
This InSpec resource has the following matchers.

name -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``name`` matcher tests the value of ``name`` as read from a |yaml| file versus the value declared in the test. For example:

.. code-block:: ruby

   its('name') { should eq 'foo' }

Examples -- DONE
-----------------------------------------------------
The following examples show how to use this InSpec resource in a recipe.

**Test a kitchen.yml file driver**

.. code-block:: ruby

   describe yaml('.kitchen.yaml') do
     its('driver.name') { should eq('vagrant') }
   end



yum -- DONE
=====================================================
Use the ``yum`` InSpec resource to test packages in the |yum| repository.

Syntax -- DONE
-----------------------------------------------------
A ``yum`` InSpec resource block declares a package repo, tests if the package repository is present, and if it that package repository is a valid package source (i.e. "is enabled"). For example:

.. code-block:: ruby

   describe yum.repo('name') do
     it { should exist }
     it { should be_enabled }
   end

where

* ``repo('name')`` is the (optional) name of a package repo, using either a full identifier (``'updates/7/x86_64'``) or a short identifier (``'updates'``)

Matchers -- DONE
-----------------------------------------------------
This InSpec resource has the following matchers.

be_enabled -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``be_enabled`` matcher tests if the package repository is a valid package source. For example:

.. code-block:: ruby

   it { should be_enabled }

exist -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``exist`` matcher tests if the package repository exists. For example:

.. code-block:: ruby

   it { should exist }

repo('name') -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``repo('name')`` matcher names a specific package repository. For example:

.. code-block:: ruby

   describe yum.repo('epel') do
     ...
   end

repos -- DONE
+++++++++++++++++++++++++++++++++++++++++++++++++++++
The ``repos`` matcher tests if a named repo, using either a full identifier (``'updates/7/x86_64'``) or a short identifier (``'updates'``), is included in the |yum| repo:

.. code-block:: ruby

   its('repos') { should include 'some_repo' }

Examples -- DONE
-----------------------------------------------------
The following examples show how to use this InSpec resource in a recipe.

**Test if the yum repo exists**

.. code-block:: ruby

   describe yum do
     its('repos') { should exist }
   end

**Test if the 'base/7/x86_64' repo exists and is enabled**

.. code-block:: ruby

   describe yum do
     its('repos') { should include 'base/7/x86_64' }
     its('epel') { should exist }
     its('epel') { should be_enabled }
   end

**Test if a specific yum repo exists**

.. code-block:: ruby

   describe yum.repo('epel') do
     it { should exist }
     it { should be_enabled }
   end
