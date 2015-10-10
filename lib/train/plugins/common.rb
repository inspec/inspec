# encoding: utf-8
#
# Author:: Dominik Richter (<dominik.richter@gmail.com>)

class Train::Plugins
  module Common
    autoload :FileCommon, 'train/plugins/file_common'
    autoload :LinuxFile,  'train/plugins/linux_file'
    autoload :OSCommon,   'train/plugins/os_common'
    CommandResult = Struct.new(:stdout, :stderr, :exit_status)
  end
end
