# encoding: utf-8

describe 'file interface' do
  let(:backend) { get_backend.call }

  describe 'a path that doesnt exist' do
    let(:file) {
      backend.file('/do_not_create_this_path_please_or_my_tests_will_fail')
    }

    it 'does not exist' do
      file.exist?.must_equal(false)
    end

    it 'is not a file' do
      file.file?.must_equal(false)
    end

    it 'has type nil' do
      file.type.must_be_nil
    end

    it 'has no content' do
      file.content.must_be_nil
    end

    it 'has no owner' do
      file.owner.must_be_nil
    end

    it 'has no group' do
      file.group.must_be_nil
    end

    it 'has mode nil' do
      file.mode.must_be_nil
    end

    it 'checks mode? nil' do
      file.mode?(nil).must_equal(true)
    end

    it 'has no link_path' do
      file.link_path.must_be_nil
    end

    it 'has an md5sum' do
      file.md5sum.must_be_nil
    end

    it 'has an sha256sum' do
      file.sha256sum.must_be_nil
    end

    it 'has a modified time' do
      file.mtime.must_be_nil
    end

    it 'has inode size' do
      # Must be around 11 Bytes, +- 4
      file.size.must_be_nil
    end

    it 'has no selinux_label' do
      file.selinux_label.must_be_nil
    end

    it 'has no product_version' do
      file.product_version.must_be_nil
    end

    it 'has no file_version' do
      file.file_version.must_be_nil
    end

  end
end
