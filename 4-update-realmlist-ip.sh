#!/bin/bash

# args
if [ -z $1 ]; then
    echo "Provide an ip or domain name that will be used by the WoW client"
    exit 1
fi

sudo docker container exec -it trinity-mysql mysql -u root -p -e "update auth.realmlist set address='$1' where id=1; select * from auth.realmlist;"
