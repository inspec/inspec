
describe 'file interface' do
  let(:backend) { get_backend.call() }

  describe 'regular file' do
    let(:file) { backend.file('/tmp/file') }

    it 'exists' do
      file.exists?.must_equal(true)
    end

    it 'is a file' do
      file.file?.must_equal(true)
    end

    it 'has type :file' do
      file.type.must_equal(:file)
    end

    it 'has content' do
      file.content.must_equal('hello world')
    end

    it 'has owner name root' do
      file.owner.must_equal('root')
    end

    it 'has group name root' do
      file.group.must_equal('root')
    end

    it 'has mode 0765' do
      file.mode.must_equal(00765)
    end

    it 'checks mode? 0765' do
      file.mode?(00765).must_equal(true)
    end

    it 'doesnt check mode? 0764' do
      file.mode?(00764).must_equal(false)
    end

    it 'has no link_target' do
      file.link_target.must_equal('')
    end
  end
end
