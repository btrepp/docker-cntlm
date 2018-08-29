#!/bin/sh
if [ $# -ne 4 ]; then
	echo "Usage: username domain NTLMv2hash upstream_proxy"
        exit 1
fi

noproxy_hosts="localhost, 127.0.0.*, 10.*, 192.168.*, *.$2"
if [ -n "$NO_PROXY" ]; then
	noproxy_hosts="$noproxy_hosts, $NO_PROXY"
fi

cat << EOF > /etc/cntlm.conf
UserName $1
Domain $2
PassNTLMv2 $3
Proxy $4
NoProxy $noproxy_hosts
Gateway yes
Listen 3128
EOF

exec /usr/sbin/cntlm -f -U cntlm -c /etc/cntlm.conf
