=====================================================
InSpec Matchers Reference
=====================================================


Inspec uses matchers to help compare resource values to expectations. The following matchers are available:

* `be`
* `cmp`
* `eq`
* `include`
* `match`
* Array matchers: `contain_match`, `all_match`, `none_match`, `contain_duplicates`


be
=====================================================

This matcher can be followed by many different comparison operators. Always make sure to use numbers, not strings, for these comparisons.

.. code-block:: ruby

  describe file('/proc/cpuinfo') do
    its('size') { should be >= 10 }
    its('size') { should be < 1000 }
  end

cmp
=====================================================

Unlike ``eq``, cmp is a matcher for less-restrictive comparisons. It will try to fit the actual value to the type you are comparing it to. This is meant to relieve the user from having to write type-casts and resolutions.

.. code-block:: ruby

  describe sshd_config do
    its('Protocol') { should cmp 2 }
  end

  describe passwd.uid(0) do
    its('users') { should cmp 'root' }
  end

``cmp`` behaves in the following way:

* Compare strings to numbers

  .. code-block:: ruby

    describe sshd_config do
      its('Protocol') { should eq '2' }

      its('Protocol') { should cmp '2' }
      its('Protocol') { should cmp 2 }
    end

* String comparisons are not case-sensitive

  .. code-block:: ruby

    describe auditd_conf do
      its('log_format') { should cmp 'raw' }
      its('log_format') { should cmp 'RAW' }
    end

* Compare arrays with only one entry to a value

  .. code-block:: ruby

    describe passwd.uids(0) do
      its('users') { should cmp 'root' }
      its('users') { should cmp ['root'] }
    end

* Single-value arrays of strings may also be compared to a regex

  .. code-block:: ruby

    describe auditd_conf do
      its('log_format') { should cmp /raw/i }
    end

* Improved printing of octal comparisons

  .. code-block:: ruby

    describe file('/proc/cpuinfo') do
      its('mode') { should cmp '0345' }
    end

    expected: 0345
    got: 0444

eq
=====================================================

Test for exact equality of two values.

.. code-block:: ruby

  describe sshd_config do
    its('RSAAuthentication') { should_not eq 'no' }
    its('Protocol') { should eq '2' }
  end

It fails if types don't match. Please keep this in mind, when comparing configuration
entries that are numbers:

.. code-block:: ruby

  its('Port') { should eq '22' } # ok

  its('Port') { should eq 22 }
  # fails: '2' != 2 (string vs int)

For less restrictive comparisons, please use ``cmp``.

include
=====================================================

Verifies if a value is included in a list.

.. code-block:: ruby

  describe passwd do
    its('users') { should include 'my_user' }
  end


match
=====================================================

Check if a string matches a regular expression.

.. code-block:: ruby

  describe sshd_config do
    its('Ciphers') { should_not match /cbc/ }
  end


Array Matchers
=====================================================

The following matchers are designed to work with arrays:


contain_match
-----------------------------------------------------

Check if an array contains at least one item that matches the regex:

.. code-block:: ruby

  describe ['lemon', 'ginger', 'grapes'] do
    it { should contain_match /^gin/}
  end
  describe port(25) do
    its('addresses') it { should_not contain_match /0\.0\.0\.0/}
  end


all_match
-----------------------------------------------------

Check if all items of an array match the regex:

.. code-block:: ruby

  describe ['grapefruit', 'grapes'] do
    it { should all_match /^grape.+/}
  end


none_match
-----------------------------------------------------

Check if all items of an array match the regex:

.. code-block:: ruby

  describe ['ginger', 'grapefruit'] do
    it { should none_match /^sugar$/}
  end
  describe port(25) do
    its('addresses') it { should none_match /^0\.0\.0\.0$/ }
  end


contain_duplicates
-----------------------------------------------------

Check if an array contains duplicate items:

.. code-block:: ruby

  describe [80, 443, 80] do
    it { should contain_duplicates }
  end
  describe ['ginger', 'grapefruit'] do
    it { should_not contain_duplicates }
  end
