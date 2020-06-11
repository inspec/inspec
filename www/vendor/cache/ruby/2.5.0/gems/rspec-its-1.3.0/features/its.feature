Feature: attribute of subject

  Scenario: specify value of a nested attribute
    Given a file named "example_spec.rb" with:
      """ruby
      class Person
        attr_reader :phone_numbers
        def initialize
          @phone_numbers = []
        end
      end

      describe Person do
        context "with one phone number (555-1212)"do
          subject do
            person = Person.new
            person.phone_numbers << "555-1212"
            person
          end

          its("phone_numbers.first") { should eq("555-1212") }
        end
      end
      """
    When I run rspec with the documentation option
    Then the output should contain:
      """
      Person
        with one phone number (555-1212)
          phone_numbers.first
            should eq "555-1212"
      """

  Scenario: specify value of an attribute of a hash
    Given a file named "example_spec.rb" with:
      """ruby
      describe Hash do
        context "with two items" do
          subject do
            {:one => 'one', :two => 'two'}
          end

          its(:size) { should eq(2) }
        end
      end
      """
    When I run rspec
    Then the examples should all pass

  Scenario: specify value for key in a hash
    Given a file named "example_spec.rb" with:
      """ruby
      describe Hash do
        context "with keys :one and 'two'" do
          subject do
            {:one => 1, "two" => 2}
          end

          its([:one]) { should eq(1) }
          its(["two"]) { should eq(2) }
        end
      end
      """
    When I run rspec
    Then the examples should all pass

  Scenario: specify value for key in a hash-like object
    Given a file named "example_spec.rb" with:
      """ruby
      require 'matrix'

      describe Matrix do
        context "with values [[1, 2], [3, 4]]" do
          subject do
            Matrix[[1, 2], [3, 4]]
          end

          its([0, 1]) { should eq(2) }
          its([1, 0]) { should eq(3) }
          its([1, 2]) { should be_nil }
        end
      end
      """
    When I run rspec
    Then the examples should all pass

 Scenario: failures are correctly reported as coming from the `its` line
    Given a file named "example_spec.rb" with:
      """ruby
      describe Array do
        context "when first created" do
          its(:size) { should_not eq(0) }
        end
      end
      """
    When I run rspec
    Then the output should contain "Failure/Error: its(:size) { should_not eq(0) }"
      And the output should not match /#[^\n]*rspec[\x2f]its/

 Scenario: examples can be specified by exact line number
    Given a file named "example_spec.rb" with:
      """ruby
      describe Array do
        context "when first created" do
          its(:size) { should eq(0) }
        end
      end
      """
    When I run rspec specifying line number 3
    Then the examples should all pass

  Scenario: examples can be specified by line number within containing block
    Given a file named "example_spec.rb" with:
    """ruby
      describe Array do
        context "when first created" do
          its(:size) { should eq(0) }
        end
        it "should never execute this" do
          expect(true).to be(false)
        end
      end
      """
    When I run rspec specifying line number 2
    Then the examples should all pass

  Scenario: specify a method throws an expection
    Given a file named "example_spec.rb" with:
      """ruby
      class Klass
        def foo
          true
        end
      end

      describe Klass do
        subject { Klass.new }
        its(:foo) { will_not raise_error }
        its(:bar) { will raise_error(NoMethodError) }
      end
      """
    When I run rspec
    Then the examples should all pass

  Scenario: specify a method does not throw an expection
    Given a file named "example_spec.rb" with:
      """ruby
      class Klass; end

      describe Klass do
        subject { Klass.new }
        its(:foo) { will_not raise_error }
      end
      """
    When I run rspec
    Then the example should fail
    And the output should contain "Failure/Error: its(:foo) { will_not raise_error }"
    And the output should contain "expected no Exception, got #<NoMethodError: undefined method `foo'"

  Scenario: examples will warn when using non block expectations
    Given a file named "example_spec.rb" with:
      """ruby
      class Klass
        def terminator
         "back"
        end
      end

      describe Klass do
        subject { Klass.new }
        its(:terminator) { will be("back") }
      end
      """
    When I run rspec
    Then the example should fail
    And the output should contain "ArgumentError:" and "`will` only supports block expectations"
