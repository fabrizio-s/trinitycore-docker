#!/bin/bash

sudo docker container run -d --name trinity-mysql --network trinity-net -v ./init-sql:/docker-entrypoint-initdb.d --env-file ./trinity-mysql.env --restart unless-stopped mysql:8.3
