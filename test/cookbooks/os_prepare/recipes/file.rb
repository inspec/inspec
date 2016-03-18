# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter
#
# prepares a sample file for verification

if node['platform_family'] != 'windows'

  gid = case node['platform_family']
        when 'aix'
          'system'
        when 'freebsd'
          'wheel'
        when 'solaris', 'solaris2'
          'sys'
        else
          'root'
        end


  file '/tmp/file' do
    mode '0765'
    owner 'root'
    group gid
    content 'hello world'
  end

  file '/tmp/sfile' do
    mode '7765'
    owner 'root'
    group gid
    content 'hello suid/sgid/sticky'
  end

  directory '/tmp/folder' do
    mode '0567'
    owner 'root'
    group gid
  end

else

  directory 'C:\Test Directory'
  file 'C:\Test Directory\test file.txt'

end
