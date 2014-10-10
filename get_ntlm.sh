#!/bin/sh
#A quick way of getting the NTLM hash to use as a password
#usage docker run --rm -t -i --entrypoint="get_ntlm.sh" btrepp/cntlm

if [ $# -ne 2 ]; then
	echo "Usage: enter username followed by proxy server adddress"
        exit 1
fi
echo "When Prompted type your password"
exec /usr/sbin/cntlm -M http://docker.io \
	-u $1 \
	$2
