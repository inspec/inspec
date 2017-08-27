echo 'echo i am setuid' > /root/i-am-setuid && chmod 4700 /root/i-am-setuid
echo 'echo i am setgid' > /root/i-am-setgid && chmod 2700 /root/i-am-setgid
mkdir /root/i-am-sticky && chmod 1700 /root/i-am-sticky
