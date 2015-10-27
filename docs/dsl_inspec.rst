=====================================================
InSpec DSL
=====================================================

|inspec| is a run-time framework and rule language used to specify compliance, securuty, and policy requirements. It includes a collection of resources---`some are part of the open source testing framework for infrastructure <URL FOR INSPEC OPEN SOURCE>`_, whereas others are available with |chef compliance|---that help you write auditing rules quickly and easily. The syntax used by both open source and |chef compliance| auditing is the same. The open source |inspec resource| framework is compatible with |chef compliance|.

The InSpec DSL is a Ruby DSL for writing audit rules, which includes audit resources that you can invoke.

The following sections describe the syntax and show some simple examples of using the |inspec resources| to define

Syntax
=====================================================

A |resource directory| resource block declares a directory and the permissions needed on that directory. For example:

.. code-block:: ruby

   rule 'sshd-8' do
     impact 0.6
     title 'Server: Configure the service port'
     desc '
       Always specify which port the SSH server should listen to.
       Prevent unexpected settings.
     '
     describe sshd_conf do
       its('Port') { should eq('22') }
     end
   end

where

* ``'sshd-8'`` is the name of the rule
* ``impact``, ``title``, and ``desc`` define metadata that fully describes the importance of the rule, its purpose, with a succinct and complete description
* ``impact`` is an integer that measures the importance of the compliance results and must be a value between ``0.0`` and ``1.0``.
* ``describe`` is a block that contains at least one test. A ``rule`` block must contain at least one ``describe`` block, but may contain as many as required
* ``sshd_conf`` is an InSpec resource. For the full list of InSpec resources, see ADD_URL
* ``its('Port')`` is the matcher; ``{ should eq('22') }`` is the test. A ``describe`` block must contain at least one matcher, but may contain as many as required


Author Tests
=====================================================
Tests are |ruby| files located in the ``/tests`` directory of a cookbook. When writing rules, the ``impact``, ``title``, ``desc`` methods are _optional_, but are highly recommended.

Serverspec => InSpec
-----------------------------------------------------
some words about converting Serverspec => InSpec go here?

* convert existing Serverspec tests to InSpec tests by wrapping the ``rule`` block around them, updating the resource, and then updating the matcher syntax

InSpec Audit Resources
-----------------------------------------------------
.. include:: ../../includes_inspec/includes_inspec_resources_list.rst

Examples
=====================================================
The following examples show simple compliance tests using a single ``rule`` block.

Test System Event Log
-----------------------------------------------------
The following test shows how to audit machines running |windows| 2008 (and newer) to audit the log file size maximum for the system event log:

.. code-block:: ruby

   rule 'windows-audit-102' do
     impact 0.1
     title 'Configure System Event Log (Setup)'
     desc 'only appies for Windows 2008 and newer'
     describe group_policy('Windows Components\\Event Log Service\\Setup') do
       its('Specify the maximum log file size (KB)') { should eq nil }
     end
   end

Are PosgtreSQL passwords empty?
-----------------------------------------------------
The following test shows how to audit machines running |postgresql| to ensure that passwords are not empty.

.. code-block:: ruby

   rule 'postgres-7' do
     impact 1.0
     title 'Don't allow empty passwords'
     desc '
       ...
     '
     sql.describe("SELECT * FROM pg_shadow WHERE passwd IS NULL;") do
       its('output') { should eq('') }
     end
   end


Are MySQL passwords in ENV?
-----------------------------------------------------
The following test shows how to audit machines running |mysql| to ensure that passwords are not stored in ``ENV``:

.. code-block:: ruby

   rule 'mysql-3' do
     impact 1.0
     title 'Do not store your MySQL password in your ENV'
     desc '
       Storing credentials in your ENV may easily expose
       them to an attacker. Prevent this at all costs.
     '
     describe command('env') do
       its(:stdout) { should_not match(/^MYSQL_PWD=/) }
     end
   end

Is /etc/ssh a Directory?
-----------------------------------------------------
The following test shows how to audit machines to ensure that ``/etc/ssh`` is a directory:

.. code-block:: ruby

   rule 'basic-1' do
     impact 1.0
     title '/etc/ssh should be a directory'
     desc '
       In order for OpenSSH to function correctly, its
       configuration path must be a folder.
     '
     describe file('/etc/ssh') do
       it { should be_directory }
     end
   end

Is Apache running?
-----------------------------------------------------
The following test shows how to audit machines to ensure that |apache| is enabled and running:

.. code-block:: ruby

   rule 'apache-1' do
     impact 0.3
     title 'Apache2 should be configured and running'
     describe service(apache.service) do
       it { should be_enabled }
       it { should be_running }
     end
   end

Have critical files changed?
-----------------------------------------------------
The following test shows how to audit machines for periodic file checking to allow a system administrator to determine on a regular basis if critical files have been changed in an unauthorized fashion:

.. code-block:: ruby

   rule 'cis-network-8.3.2' do
     impact 0.7
     title '8.3.2 Implement Periodic Execution of File Integrity'
     describe cron do
       it { should have_entry('0 5 * * * /usr/sbin/aide --check') }
     end
   end


Test Remote Desktop Security
-----------------------------------------------------
The following test shows how to audit machines to ensure Windows Remote Desktop always asks for a password and uses strong encryption:

.. code-block:: ruby

   rule 'windows-rdp-100' do
     impact 1.0
     title 'Windows Remote Desktop Configured to Always Prompt for Password'
     describe group_policy('Windows Components\\Remote Desktop Services\\Remote Desktop Session Host\\Security') do
       its('Always prompt for password upon connection') { should eq 1 }
     end
   end

   rule 'windows-rdp-101' do
     impact 1.0
     title 'Strong Encryption for Windows Remote Desktop Required'
     describe group_policy('Windows Components\\Remote Desktop Services\\Remote Desktop Session Host\\Security') do
       its('Set client connection encryption level') { should eq 3 }
     end
   end
