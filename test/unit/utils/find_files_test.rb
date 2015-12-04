# encoding: utf-8
# author: Stephan Renatus

require 'helper'

describe FindFiles do
  let (:findfiles) do
    class FindFilesTest
      include FindFiles
      def inspec
        Inspec::Backend.create(backend: :mock)
      end
    end
    FindFilesTest.new
  end

  describe '#find_files' do
    it 'returns an array (of findings)' do
      files = findfiles.find_files('/no/such/mock', type: 'file', depth: 1)
      files.must_equal([])
    end
  end
end
