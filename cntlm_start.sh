#!/bin/sh
if [ $# -ne 5 ]; then
	echo "Usage: username domain NTLMv2hash upstream_proxy no_proxy_csv"
        exit 1
fi
echo UserName $1 >> /etc/cntlm.ini
echo Domain $2 >> /etc/cntlm.ini
echo PassNTLMv2 $3 >> /etc/cntlm.ini
echo Proxy $4 >> /etc/cntlm.ini
echo NoProxy localhost, 127.0.0.*, 10.*, 192.168.*, *.$2, $5 >> /etc/cntlm.ini
echo Gateway yes >> /etc/cntlm.ini
echo Listen 3128 >> /etc/cntlm.ini

exec /usr/sbin/cntlm -f -U cntlm -c /etc/cntlm.ini
