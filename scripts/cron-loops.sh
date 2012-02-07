#!/bin/bash

pwd=$( readlink -f "$( dirname "$BASH_SOURCE" )" )
# PROJECT_HOME=$pwd/..

case $1 in
"start")
#OLD=$PWD
#cd $PROJECT_HOME
python manage.py cron_loop quick &
#python manage.py cron_loop normal &
python manage.py cron_loop general &
#cd $OLD
;;
"stop")
#OLD=$PWD
#cd $PROJECT_HOME
ps aux | grep "cron_loop" | awk '{system($11 == "python" ? "kill -9 "$2 : "echo MERCY THIS ONE: "$2)}'
#cd $OLD
;;
"restart")
bash $BASH_SOURCE stop
sleep 1
bash $BASH_SOURCE start
;;
"show")
ps aux | grep "cron_loop" | awk '{system($11 == "python" ? "echo pid="$2" start="$9 : "")}'
;;
*) echo "Usage: ./cron-loops.sh {start|stop|restart}"
esac