#!/usr/bin/env bash

service ssh start

touch /home/LogFiles/node_out.log

#echo "$(date) Container started" >> /home/LogFiles/node_out.log

node /opt/app.js
