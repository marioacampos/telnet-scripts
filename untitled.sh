host=localhost
DATE=`date +%Y-%m-%d`
TIME=`date +%H%M%S`
LOG_OK=/tmp/telnet_ok
LOG_FAIL=/tmp/telnet_falha

for port in 80 25 22 443 110
do
if telnet -c $host $port </dev/null 2>&1 | grep -q Escape; then
  echo "$DATE $TIME  $port: Connected" >> $LOG_OK
else
  echo "$DATE $TIME $port : no connection" >> $LOG_FAIL
fi
done