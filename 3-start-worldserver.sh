#!/bin/bash

sudo docker container run -it --rm --name trinity-worldserver --network trinity-net -v ./configs:/home/circleci/project/bin/check_install/etc -v ./server-data:/trinity/data -v ./db/TDB_full_world_335.24041_2024_04_10.sql:/home/circleci/TDB_full_world_335.24041_2024_04_10.sql -p 8085:8085 --entrypoint worldserver trinitycore/trinitycore:3.3.5
