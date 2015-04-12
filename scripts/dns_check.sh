#!/bin/bash

if [ $# -ne 3 ]; then
	echo "Usage: $0 [host] [dns_name] [actual_ip]"
	exit 1
fi

## USER CONFIG
# There is no user config
## END USER CONFIG

HOST=$1
DNS_NAME=$2
DNS_IP=$3

COMMAND="dig @$HOST +short A $DNS_NAME"
OUTPUT=$(eval $COMMAND)

echo "ScoreEngine Module: dns_check"
echo
echo "RUNNING: $COMMAND"
echo "EXPECTED: $DNS_IP"
echo "OUTPUT: $OUTPUT"

if [ "$OUTPUT" == "$DNS_IP" ]; then
	exit 0;
else
	exit 1;
fi