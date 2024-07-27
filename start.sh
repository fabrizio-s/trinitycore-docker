#!/bin/bash

sudo docker container start trinity-mysql
./5-start-authserver.sh
./3-start-worldserver.sh
