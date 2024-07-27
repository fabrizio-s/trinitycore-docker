#!/bin/bash

sudo docker container run -d --rm --name trinity-authserver --network trinity-net -v ./configs:/home/circleci/project/bin/check_install/etc -p 3724:3724 --entrypoint authserver trinitycore/trinitycore:3.3.5
