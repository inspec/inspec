# encoding: utf-8

describe 'file interface' do
  let(:backend) { get_backend.call }

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
end
