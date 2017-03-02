#! /bin/bash

# install upstart and monit

sudo apt-get install upstart monit

# paste configuration files
cd /etc/init
sudo touch scribble.conf
cat <<EOF > scribble.conf

#!upstart
description "node.js server"
author      "joe"

start on startup
stop on shutdown

script
    export HOME="/root"

    exec sudo -u ubuntu /usr/bin/nodemon /home/ubuntu/scribble/server.js >> /home/ubuntu/scribble/server.sys.log 2>&1
end script

pre-start script
    # 
end script

pre-stop script
    #
end script

EOF

sudo chmod +x /etc/init/scribble.conf

cd /etc/monit
cat <<EOF > monitrc

#!monit
http://mmonit.com/monit/
check host my-node-app with address 127.0.0.1
    start program = "/sbin/start scribble"
    stop program = "/sbin/stop scribble"
    if failed port 3000 protocol HTTP
        request /
        with timeout 5 seconds
        then restart
    if 5 restarts within 5 cycles then timeout
EOF

sudo start scribble
monit -d 60 -c /etc/monit/monitrc