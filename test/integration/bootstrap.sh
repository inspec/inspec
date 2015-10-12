#!/bin/sh
test ! -e /tmp/folder && \
  mkdir /tmp/folder
chmod 0567 /tmp/folder

echo -n 'hello world' > /tmp/file
test ! -e /tmp/symlink && \
  ln -s /tmp/file /tmp/symlink
chmod 0777 /tmp/symlink
chmod 0765 /tmp/file

test ! -e /tmp/pipe && \
  mkfifo /tmp/pipe

test ! -e /tmp/block_device && \
  mknod /tmp/block_device b 7 7
chmod 0666 /tmp/block_device
