#!/usr/bin/env sh

/sbin/openrc
touch /run/openrc/softlevel

cd /etc/init.d

echo Starting dbus
./dbus start

echo Starting bluetooth
./bluetooth start
sleep 1
./bluetooth stop
sleep 1
./bluetooth start

cd /app

echo Running npm version `npm -v`

npm start
