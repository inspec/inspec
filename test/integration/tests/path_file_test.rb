# encoding: utf-8

describe 'file interface' do
  let(:backend) { get_backend.call }

  describe 'regular file' do
    let(:file) { backend.file('/tmp/file') }

    it 'exists' do
      file.exist?.must_equal(true)
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

    it 'has group name' do
      file.group.must_equal(Test.root_group(backend.os))
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
      file.mtime.must_be_close_to(Time.now.to_i - Test.mtime/2, Test.mtime)
    end

    it 'has size' do
      # Must be around 11 Bytes, +- 4
      file.size.must_be_close_to(11, 4)
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
