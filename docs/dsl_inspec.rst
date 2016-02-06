=====================================================
InSpec DSL
=====================================================

|inspec| is a run-time framework and rule language used to specify compliance, security, and policy requirements. It includes a collection of resources that help you write auditing controls quickly and easily. The syntax used by both open source and |chef compliance| auditing is the same. The open source |inspec resource| framework is compatible with |chef compliance|.

The InSpec DSL is a Ruby DSL for writing audit controls, which includes audit resources that you can invoke.

The following sections describe the syntax and show some simple examples of using the |inspec resources| to define

Syntax
=====================================================

The following resource tests |ssh| server configuration. For example, a simple control may described as:

.. code-block:: ruby

  describe sshd_config do
    its('Port') { should eq('22') }
  end

In various use cases like implementing IT compliance across different departments, it becomes handy to extend the control with metadata. Each control may define an additional ``impact``, ``title`` or ``desc``. An example looks like:

.. code-block:: ruby

   control 'sshd-8' do
     impact 0.6
     title 'Server: Configure the service port'
     desc '
       Always specify which port the SSH server should listen to.
       Prevent unexpected settings.
     '
     describe sshd_config do
       its('Port') { should eq('22') }
     end
   end

where

* ``'sshd-8'`` is the name of the control
* ``impact``, ``title``, and ``desc`` define metadata that fully describes the importance of the control, its purpose, with a succinct and complete description
* ``impact`` is an float that measures the importance of the compliance results and must be a value between ``0.0`` and ``1.0``.
* ``describe`` is a block that contains at least one test. A ``control`` block must contain at least one ``describe`` block, but may contain as many as required
* ``sshd_config`` is an |inspec| resource. For the full list of InSpec resources, see |inspec| resource documentation
* ``its('Port')`` is the matcher; ``{ should eq('22') }`` is the test. A ``describe`` block must contain at least one matcher, but may contain as many as required


Author Tests
-----------------------------------------------------
It is recommended that test files are located in the ``/tests`` directory. When writing controls, the ``impact``, ``title``, ``desc`` metadata are _optional_, but are highly recommended.

Examples
=====================================================
The following examples show simple compliance tests using a single ``control`` block.

Test System Event Log
-----------------------------------------------------
The following test shows how to audit machines running |windows| 2012 R2 that pwassword complexity is enabled:

.. code-block:: ruby

  control 'windows-account-102' do
    impact 1.0
    title 'Windows Password Complexity is Enabled'
    desc 'Password must meet complexity requirement'
    describe security_policy do
      its('PasswordComplexity') { should eq 1 }
    end
  end

Are PosgtreSQL passwords empty?
-----------------------------------------------------
The following test shows how to audit machines running |postgresql| to ensure that passwords are not empty.

.. code-block:: ruby

   control 'postgres-7' do
     impact 1.0
     title 'Don't allow empty passwords'
     describe postgres_session('user', 'pass').query("SELECT * FROM pg_shadow WHERE passwd IS NULL;") do
       its('output') { should eq('') }
     end
   end


Are MySQL passwords in ENV?
-----------------------------------------------------
The following test shows how to audit machines running |mysql| to ensure that passwords are not stored in ``ENV``:

.. code-block:: ruby

   control 'mysql-3' do
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

   control 'basic-1' do
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

   control 'apache-1' do
     impact 0.3
     title 'Apache2 should be configured and running'
     describe service(apache.service) do
       it { should be_enabled }
       it { should be_running }
     end
   end

Are insecure packages installed ?
-----------------------------------------------------
The following test shows how to audit machines for insecure packages:

.. code-block:: ruby

  control 'cis-os-services-5.1.3' do
    impact 0.7
    title '5.1.3 Ensure rsh client is not installed'

    describe package('rsh') do
      it { should_not be_installed }
    end

    describe package('rsh-redone-client') do
      it { should_not be_installed }
    end
  end


Test Windows Registry Keys
-----------------------------------------------------
The following test shows how to audit machines to ensure Safe DLL Seach Mode is enabled:

.. code-block:: ruby

  control 'windows-base-101' do
    impact 1.0
    title 'Safe DLL Search Mode is Enabled'
    desc '
      @link: https://msdn.microsoft.com/en-us/library/ms682586(v=vs.85).aspx
    '
    describe registry_key('HKLM\\System\\CurrentControlSet\\Control\\Session Manager') do
      it { should exist }
      it { should_not have_property_value('SafeDllSearchMode', :type_dword, '0') }
    end
  end

.. |inspec| replace:: InSpec
.. |inspec resource| replace:: InSpec Resource
.. |chef compliance| replace:: Chef Compliance
.. |ruby| replace:: Ruby
.. |ruby| replace:: SSH
.. |windows| replace:: Microsoft Windows
.. |postgresql| replace:: PostgreSQL
.. |apache| replace:: Apache
