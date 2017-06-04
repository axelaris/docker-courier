#!/bin/sh
/usr/lib/courier/courier-authlib/authdaemond &
/sbin/rpcbind -w &
/usr/sbin/famd -T 0
/usr/sbin/couriertcpd -address=0 -maxprocs=40 -maxperip=20 -nodnslookup -noidentlookup -stderr=/var/log/courier/mail.log 143 /usr/lib/courier/courier/imaplogin /usr/bin/imapd Maildir &
/usr/sbin/couriertcpd -maxprocs=40 -maxperip=4 -nodnslookup -noidentlookup -address=0 -stderr=/var/log/courier/mail.log 110 /usr/lib/courier/courier/courierpop3login /usr/lib/courier/courier/courierpop3d Maildir 
