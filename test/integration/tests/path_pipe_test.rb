# encoding: utf-8

describe 'file interface' do
  let(:backend) { get_backend.call }

  describe 'pipe / fifo' do
    let(:file) { backend.file('/tmp/pipe') }

    it 'exists' do
      file.exist?.must_equal(true)
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
      file.group.must_equal(Test.root_group(backend.os))
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
