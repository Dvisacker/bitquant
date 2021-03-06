#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
WEB_DIR=$SCRIPT_DIR/..
GIT_DIR=$WEB_DIR/../..
LOG_DIR=$WEB_DIR/log
cd $SCRIPT_DIR
. rootcheck.sh

su redis -s "/bin/bash" -c "/usr/bin/redis-server /etc/redis.conf" &
su mongod -s "/bin/bash" -c "/usr/bin/mongod --quiet -f /etc/mongod.conf" &
/usr/sbin/httpd -DFOREGROUND &
if [ -f /etc/webmin/start ] ; then
    echo "Start webmin"
    /etc/webmin/start
fi
su user -c ./startup.sh
while :; do sleep 2; done


