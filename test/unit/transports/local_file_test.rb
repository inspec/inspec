# encoding: utf-8
#
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'
require 'train/transports/local'

describe 'local file transport' do
  let(:transport) { Train::Transports::Local.new }

  it 'gets file contents' do
    res = rand
    File.stub :read, res do
      transport.file(rand).content.must_equal(res)
    end
  end

  it 'checks for file existance' do
    File.stub :exist?, true do
      transport.file(rand).exist?.must_equal(true)
    end
  end

  {
    exist?:            :exist?,
    file?:             :file?,
    socket?:           :socket?,
    directory?:        :directory?,
    symlink?:          :symlink?,
    pipe?:             :pipe?,
    character_device?: :chardev?,
    block_device?:     :blockdev?,
  }.each do |method, file_method|
    it "checks if file is a #{method}" do
      File.stub file_method.to_sym, true do
        transport.file(rand).method(method.to_sym).call.must_equal(true)
      end
    end
  end

  it 'checks a file\'s link path' do
    out = rand.to_s
    File.stub :readlink, out do
      File.stub :symlink?, true do
        transport.file(rand).link_path.must_equal out
      end
    end
  end

  describe 'file metadata' do
    let(:stat) { Struct.new(:mode, :size, :mtime, :uid, :gid) }
    let(:statres) { stat.new(00140755, rand, (rand*100).to_i, rand, rand) }

    def meta_stub(method, param, &block)
      pwres = Struct.new(:name)
      Etc.stub :getpwuid, pwres.new('owner') do
        Etc.stub :getgrgid, pwres.new('group') do
          File.stub method, param do; yield; end
        end
      end
    end

    it 'recognizes type' do
      meta_stub :lstat, statres do
        transport.file(rand).type.must_equal :socket
      end
    end

    it 'recognizes mode' do
      meta_stub :lstat, statres do
        transport.file(rand).mode.must_equal 00755
      end
    end

    it 'recognizes mtime' do
      meta_stub :lstat, statres do
        transport.file(rand).mtime.must_equal statres.mtime
      end
    end

    it 'recognizes size' do
      meta_stub :lstat, statres do
        transport.file(rand).size.must_equal statres.size
      end
    end

    it 'recognizes owner' do
      meta_stub :lstat, statres do
        transport.file(rand).owner.must_equal 'owner'
      end
    end

    it 'recognizes group' do
      meta_stub :lstat, statres do
        transport.file(rand).group.must_equal 'group'
      end
    end

    it 'recognizes selinux label' do
      meta_stub :lstat, statres do
        label = rand.to_s
        res = Train::Plugins::Common::CommandResult.new(label, nil, 0)
        transport.stub :run_command, res do
          transport.file(rand).selinux_label.must_equal label
        end
      end
    end
  end

end
