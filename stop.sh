#!/bin/bash

sudo docker container stop trinity-authserver
sudo docker container stop trinity-worldserver 2>/dev/null
sudo docker container stop trinity-mysql
