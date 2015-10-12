# encoding: utf-8

describe 'file interface' do
  let(:backend) { get_backend.call }

  describe 'character device' do
    let(:file) { backend.file('/dev/null') }

    it 'exists' do
      file.exist?.must_equal(true)
    end

    it 'is a character device' do
      file.character_device?.must_equal(true)
    end

    it 'has type :character_device' do
      file.type.must_equal(:character_device)
    end

    it 'has empty content' do
      file.content.must_equal('')
    end

    it 'has owner name root' do
      file.owner.must_equal('root')
    end

    it 'has group name' do
      file.group.must_equal(Test.root_group(backend.os))
    end

    it 'has mode 0666' do
      file.mode.must_equal(00666)
    end

    it 'checks mode? 0666' do
      file.mode?(00666).must_equal(true)
    end

    it 'has no link_path' do
      file.link_path.must_be_nil
    end

    it 'has an md5sum' do
      file.md5sum.must_equal('d41d8cd98f00b204e9800998ecf8427e')
    end

    it 'has an sha256sum' do
      file.sha256sum.must_equal('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')
    end

    it 'has a modified time' do
      file.mtime.must_be_close_to(Time.now.to_i - Test.mtime/2, Test.mtime)
    end

    it 'has inode size of 0' do
      file.size.must_equal(0)
    end

    it 'has selinux label handling' do
      res = Test.selinux_label(backend, file.path)
      file.selinux_label.must_equal(res)
    end

    it 'has no product_version' do
      file.product_version.must_equal(nil)
    end

    it 'has no file_version' do
      file.file_version.must_equal(nil)
    end
  end
end
