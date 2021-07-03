#!/bin/bash

### Set initial time of file
LTIME=`stat -c %Z /tmp/dhcpd_hostlist`

while true    
do
   ATIME=`stat -c %Z /tmp/dhcpd_hostlist`

   if [[ "$ATIME" != "$LTIME" ]]
   then    
       echo "RUN COMMAND"
       kill $(pidof dnsmasq); /usr/sbin/dnsmasq --except-interface=lo -r /tmp/resolv.conf --addn-hosts=/tmp/dhcpd_hostlist
       LTIME=$ATIME
   fi
   sleep 5
done
