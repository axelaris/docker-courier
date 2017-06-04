#!/bin/sh
/usr/lib/courier/courier-authlib/authdaemond &
/sbin/rpcbind -w &
/usr/sbin/famd -T 0
/usr/sbin/couriertcpd -address=0 -maxprocs=40 -maxperip=20 -nodnslookup -noidentlookup 143 /usr/lib/courier/courier/imaplogin /usr/bin/imapd Maildir >/var/log/courier/mail.log &
/usr/sbin/couriertcpd -maxprocs=40 -maxperip=4 -nodnslookup -noidentlookup -address=0 110 /usr/lib/courier/courier/courierpop3login /usr/lib/courier/courier/courierpop3d Maildir >/var/log/courier/mail.log 
