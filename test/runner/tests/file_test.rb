
describe 'file interface' do
  let(:backend) { get_backend.call() }

  describe 'regular file' do
    let(:file) { backend.file('/tmp/file') }

    it 'can identify it as a file' do
      file.file?.must_equal(true)
      file.type.must_equal(:file)
    end

    it 'can read its content' do
      file.content.must_equal('hello world')
    end

    it 'can get the owner by name' do
      file.owner.must_equal('root')
    end

    it 'can get the group by name' do
      file.group.must_equal('root')
    end
  end
end
