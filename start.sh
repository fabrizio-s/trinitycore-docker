#!/bin/bash

sudo docker container start trinity-mysql
sleep 20
./5-start-authserver.sh
./3-start-worldserver.sh
