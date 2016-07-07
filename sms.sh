#!/bin/sh
HOME=/etc
PATH=/bin:/sbin:/usr/bin:/usr/sbin
LOGFILE="/tmp/zabbix-sms.log"
echo "Recipient='$1' Message='$3'" >> ${LOGFILE}
MOBILE_NUMBER=`echo "$1" | sed s#\s##`
# Log it
echo "echo $3 | /usr/bin/sudo /usr/bin/gammu --config /etc/gammurc --sendsms TEXT ${MOBILE_NUMBER}" >>${LOGFILE}
# Send it
echo "$3" | /usr/bin/sudo /usr/bin/gammu --config /etc/gammurc --sendsms TEXT "${MOBILE_NUMBER}" 1>>${LOGFILE} 2>&1
# EO