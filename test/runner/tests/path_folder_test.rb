# encoding: utf-8

describe 'file interface' do
  let(:backend) { get_backend.call }

  describe 'a folder' do
    let(:file) { backend.file('/tmp/folder') }

    it 'exists' do
      file.exists?.must_equal(true)
    end

    it 'is a directory' do
      file.directory?.must_equal(true)
    end

    it 'has type :directory' do
      file.type.must_equal(:directory)
    end

    it 'has no content' do
      file.content.must_equal(nil)
    end

    it 'has owner name root' do
      file.owner.must_equal('root')
    end

    it 'has group name' do
      file.group.must_equal(Test.root_group(os))
    end

    it 'has mode 0567' do
      file.mode.must_equal(00567)
    end

    it 'checks mode? 0567' do
      file.mode?(00567).must_equal(true)
    end

    it 'has no link_path' do
      file.link_path.must_be_nil
    end

    it 'has an md5sum' do
      file.md5sum.must_equal(nil)
    end

    it 'has an sha256sum' do
      file.sha256sum.must_equal(nil)
    end

    it 'has a modified time' do
      file.mtime.must_be_close_to(Time.now.to_i - Test.mtime/2, Test.mtime)
    end

    it 'has inode size' do
      file.size.must_be_close_to(4096, 4096)
    end

    it 'has selinux label handling' do
      file.selinux_label.must_equal(Test.selinux_label(os, file.path))
    end

    it 'has no product_version' do
      file.product_version.must_equal(nil)
    end

    it 'has no file_version' do
      file.file_version.must_equal(nil)
    end
  end
end
