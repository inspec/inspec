# encoding: utf-8

describe 'file interface' do
  let(:backend) { get_backend.call }

  describe 'a folder' do
    let(:file) { backend.file('/tmp/folder') }

    it 'exists' do
      file.exist?.must_equal(true)
    end

    it 'is a directory' do
      file.directory?.must_equal(true)
    end

    it 'has type :directory' do
      file.type.must_equal(:directory)
    end

    if get_backend.call.os[:family] == 'freebsd'
      it 'has freebsd folder content behavior' do
        file.content.must_equal("\u0003\u0000")
      end

      it 'has an md5sum' do
        file.md5sum.must_equal('598f4fe64aefab8f00bcbea4c9239abf')
      end

      it 'has an sha256sum' do
        file.sha256sum.must_equal('9b4fb24edd6d1d8830e272398263cdbf026b97392cc35387b991dc0248a628f9')
      end
    else
      it 'has no content' do
        file.content.must_equal(nil)
      end

      it 'has an md5sum' do
        file.md5sum.must_equal(nil)
      end

      it 'has an sha256sum' do
        file.sha256sum.must_equal(nil)
      end
    end

    it 'has owner name root' do
      file.owner.must_equal('root')
    end

    it 'has group name' do
      file.group.must_equal(Test.root_group(backend.os))
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

    it 'has a modified time' do
      file.mtime.must_be_close_to(Time.now.to_i - Test.mtime/2, Test.mtime)
    end

    it 'has inode size' do
      file.size.must_be_close_to(4096, 4096)
    end

    it 'has selinux label handling' do
      res = Test.selinux_label(backend.os, file.path)
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
