#!/bin/bash
#bash to check ping and telnet status.
#set -x;
#
#clear
#printf "%-30s | %-30s | %-30s | %-30s" 

SetParam() {
export URLFILE="/home/mariocampos/financiadores.txt"
export TIME=`date +%d-%m-%Y_%H.%M.%S`
export STATUS_UP=`echo "UP"`
export STATUS_DOWN=`echo "DOWN"`
export port=80
export SHELL_LOG="`basename $0`.log"
}

Ping_Hosts() {

SetParam
cat $URLFILE | while read next
do

server=`echo $next | cut -d : -f1`

ping -i 2 -c 6 $server > /dev/null 2>&1

if [ $? -eq 0 ] ; then
echo "$TIME : Estado del Financiador $server = $STATUS_UP";
else
echo "$TIME : Estado del Financiador = $STATUS_DOWN";
#echo "$TIME : Estado del Financiador = $STATUS_DOWN" | mailx -s "$server Host DOWN!!!" $MAIL_TO

fi
done;
}

Telnet_Status() {

SetParam

cat $URLFILE | while read next
do

server=`echo $next | cut -d : -f1`
port=`echo $next | awk -F":" '{print $2}'`

TELNETCOUNT=`sleep 5 | telnet $server $port | grep -v "Connection refused" | grep "Connected to" | grep -v grep | wc -l`

if [ $TELNETCOUNT -eq 1 ] ; then

echo -e "$TIME : Port $port of Financiador $server:$port is OPEN"
else
echo -e "$TIME : Port $port of Financiador $server:$port is NOT OPEN"
#echo -e "$TIME : Port $port of Financiador http://$server:$port/ is NOT OPEN" | mailx -s "Port $port of URL $server:$port/ is DOWN!!!" $MAIL_TO;

fi
done;

}
Main() {
Ping_Hosts
Telnet_Status
}
SetParam
Main | tee -a $SHELL_LOGclear





exit
