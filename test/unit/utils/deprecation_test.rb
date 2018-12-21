require 'minitest'
require 'minitest/spec'
require 'stringio'

# require 'inspec/deprecation'

describe 'The global deprecation method' do
  describe 'when you load the deprecation system' do
    it 'Inspec must have a class method' do
      Inspec.must_respond_to :deprecate
    end
    it 'must take two required and one optional arg' do
      # See http://ruby-doc.org/core-2.5.3/Method.html#method-i-arity
      Inspec.class.method(:deprecate).arity.must_equal -3
    end
  end
end

describe 'The deprecation config file object' do
  describe 'when finding the file' do
    describe 'when you load the default file' do
    end
    describe 'when the file does not exist' do
    end
    describe 'when you load from a specified io' do
    end
  end

  describe 'validating the contents' do
    describe 'when the file version is missing' do
    end
    describe 'when the file version is unsupported' do
    end
    describe 'when the output stream is unrecognized' do
    end
    describe 'when the groups entry is not a hash' do
    end
    describe 'when a group entry has an unrecognized action' do
    end
    describe 'when recognized actions are presented' do
    end
  end
end

describe 'The Deprecator object' do
  describe 'initializing' do
    describe 'when it has no args' do
    end
    describe 'when it has an io arg' do
    end
  end

  describe 'when listing groups' do
    describe 'when there are no groups' do
    end
    describe 'when there are some groups' do
    end
  end

  # TODO - anything else here?
end

describe 'Using the deprecation facility' do
  describe 'when we check the output stream' do
    describe 'when the output stream is unspecified' do
    end
    describe 'when the output stream is stdout' do
    end
    describe 'when the output stream is stderr' do
    end
  end

  describe 'when the global deprecate method is called' do
    describe 'when the group is unrecognized' do
    end
    describe 'when the action is to ignore' do
    end
    describe 'when the action is to warn' do
    end
    describe 'when the action is to fail the control' do
    end
    describe 'when the action is to abort the run' do
    end
  end
end