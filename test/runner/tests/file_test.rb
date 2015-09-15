# encoding: utf-8

# MTime tracks the maximum range of modification time in seconds.
# i.e. MTime == 60*60*1 is 1 hour of modification time range,
# which translates to a modification time range of:
#   [ now-1hour, now ]
MTime = 60 * 60 * 1

describe 'file interface' do
  let(:backend) { get_backend.call }

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

    it 'has no link_path' do
      file.link_path.must_be_nil
    end

    it 'has an md5sum' do
      file.md5sum.must_equal('5eb63bbbe01eeed093cb22bb8f5acdc3')
    end

    it 'has an sha256sum' do
      file.sha256sum.must_equal('b94d27b9934d3e08a52e52d7da7dabfac484efe37a5380ee9088f7ace2efcde9')
    end

    it 'has a modified time' do
      file.mtime.must_be_close_to(Time.now.to_i - MTime/2, MTime)
    end

    it 'has size' do
      # Must be around 11 Bytes, +- 4
      file.size.must_be_close_to(11, 4)
    end

    it 'has no selinux_label' do
      file.selinux_label.must_equal(nil)
    end

    it 'has no product_version' do
      file.product_version.must_equal(nil)
    end

    it 'has no file_version' do
      file.file_version.must_equal(nil)
    end
  end

  describe 'regular folder' do
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

    it 'has group name root' do
      file.group.must_equal('root')
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
      file.mtime.must_be_close_to(Time.now.to_i - MTime/2, MTime)
    end

    it 'has inode size' do
      # Must be around 11 Bytes, +- 4
      file.size.must_be_close_to(200, 198)
    end

    it 'has no selinux_label' do
      file.selinux_label.must_equal(nil)
    end

    it 'has no product_version' do
      file.product_version.must_equal(nil)
    end

    it 'has no file_version' do
      file.file_version.must_equal(nil)
    end
  end

  describe 'character device' do
    let(:file) { backend.file('/dev/null') }

    it 'exists' do
      file.exists?.must_equal(true)
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

    it 'has group name root' do
      file.group.must_equal('root')
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
      file.mtime.must_be_close_to(Time.now.to_i - MTime/2, MTime)
    end

    it 'has inode size of 0' do
      file.size.must_equal(0)
    end

    it 'has no selinux_label' do
      file.selinux_label.must_equal(nil)
    end

    it 'has no product_version' do
      file.product_version.must_equal(nil)
    end

    it 'has no file_version' do
      file.file_version.must_equal(nil)
    end
  end

  describe 'block device' do
    let(:file) { backend.file('/dev/loop1') }

    it 'exists' do
      file.exists?.must_equal(true)
    end

    it 'is a block device' do
      file.block_device?.must_equal(true)
    end

    it 'has type :block_device' do
      file.type.must_equal(:block_device)
    end

    it 'has no content' do
      file.content.must_be_nil
    end

    it 'has owner name root' do
      file.owner.must_equal('root')
    end

    it 'has group name' do
      file.group.must_equal('disk')
    end

    it 'has mode 0660' do
      file.mode.must_equal(00660)
    end

    it 'checks mode? 0660' do
      file.mode?(00660).must_equal(true)
    end

    it 'has no link_path' do
      file.link_path.must_be_nil
    end

    it 'has no md5sum' do
      file.md5sum.must_be_nil
    end

    it 'has no sha256sum' do
      file.sha256sum.must_be_nil
    end

    it 'has a modified time' do
      file.mtime.must_be_close_to(Time.now.to_i - MTime/2, MTime)
    end

    it 'has inode size of 0' do
      file.size.must_equal(0)
    end

    it 'has no selinux_label' do
      file.selinux_label.must_equal(nil)
    end

    it 'has no product_version' do
      file.product_version.must_equal(nil)
    end

    it 'has no file_version' do
      file.file_version.must_equal(nil)
    end
  end

  describe 'pipe / fifo' do
    let(:file) { backend.file('/tmp/pipe') }

    it 'exists' do
      file.exists?.must_equal(true)
    end

    it 'is a pipe' do
      file.pipe?.must_equal(true)
    end

    it 'has type :pipe' do
      file.type.must_equal(:pipe)
    end

    # # TODO add back content
    # it 'has no content' do
    #   file.content.must_be_nil
    # end

    it 'has owner name root' do
      file.owner.must_equal('root')
    end

    it 'has group name' do
      file.group.must_equal('root')
    end

    it 'has mode 0644' do
      file.mode.must_equal(00644)
    end

    it 'checks mode? 0644' do
      file.mode?(00644).must_equal(true)
    end

    it 'has no link_path' do
      file.link_path.must_be_nil
    end

    # # TODO add back content
    # it 'has no md5sum' do
    #   file.md5sum.must_be_nil
    # end
    #
    # # TODO add back content
    # it 'has no sha256sum' do
    #   file.sha256sum.must_be_nil
    # end

    it 'has a modified time' do
      file.mtime.must_be_close_to(Time.now.to_i - MTime/2, MTime)
    end

    it 'has inode size of 0' do
      file.size.must_equal(0)
    end

    it 'has no selinux_label' do
      file.selinux_label.must_equal(nil)
    end

    it 'has no product_version' do
      file.product_version.must_equal(nil)
    end

    it 'has no file_version' do
      file.file_version.must_equal(nil)
    end
  end

  describe 'symlink file' do
    let(:file) { backend.file('/tmp/symlink') }

    it 'exists' do
      file.exists?.must_equal(true)
    end

    it 'is a symlink' do
      file.symlink?.must_equal(true)
    end

    it 'is pointing to a file' do
      file.file?.must_equal(true)
    end

    it 'is not pointing to a folder' do
      file.directory?.must_equal(false)
    end

    it 'has type :symlink' do
      file.type.must_equal(:symlink)
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

    it 'has mode 0777' do
      file.mode.must_equal(00777)
    end

    it 'checks mode? 0777' do
      file.mode?(00777).must_equal(true)
    end

    it 'has link_path' do
      file.link_path.must_equal('/tmp/file')
    end

    it 'has an md5sum' do
      file.md5sum.must_equal('5eb63bbbe01eeed093cb22bb8f5acdc3')
    end

    it 'has an sha256sum' do
      file.sha256sum.must_equal('b94d27b9934d3e08a52e52d7da7dabfac484efe37a5380ee9088f7ace2efcde9')
    end

    it 'has a modified time' do
      file.mtime.must_be_close_to(Time.now.to_i - MTime/2, MTime)
    end

    it 'has size' do
      # Must be around 11 Bytes, +- 4
      file.size.must_be_close_to(11, 4)
    end

    it 'has no selinux_label' do
      file.selinux_label.must_equal(nil)
    end

    it 'has no product_version' do
      file.product_version.must_equal(nil)
    end

    it 'has no file_version' do
      file.file_version.must_equal(nil)
    end
  end
end
