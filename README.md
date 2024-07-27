Tested with docker version 27.0.3, and docker-compose version 2.28.1

1) Setting up the data dir

Before running for the first time, it is necessary to run the mapextractor, vmap4extractor (optional), and mmaps_generator (optional) binaries, and place their outputs inside the DataDir (https://trinitycore.info/en/install/Server-Setup/Linux-Server-Setup). To do this, follow these steps:

1.1) Copy WoW 3.3.5a client directory to this directory, and rename it to 'client'

1.2) Create a directory named 'server-data' inside this directory

1.3) Change the ownership of the client and server-data directories to that of the circleci user inside the trinitycore container. You can check the uid and gid of the circleci user with the following command:

docker container run --rm --entrypoint /bin/bash trinitycore/trinitycore:3.3.5 -c id circleci

It should print something like this:

uid=3434(circleci) gid=3434(circleci) groups=3434(circleci)

To actually change the ownership of the client and server-data directories, run as root:

chown -R 3434:3434 client
chown -R 3434:3434 server-data

1.4) Run the following command to extract the needed resources and place them in the correct directory:

docker container run --rm -v ./server-data:/trinity/data -v ./client:/trinity/client -v ./data-setup/data-setup.sh:/home/circleci/data-setup.sh --entrypoint /bin/bash trinitycore/trinitycore:3.3.5 -c ./data-setup.sh

################################################################

2) Database installation

2.1) Download the latest "TDB 335.*" from the following link:

https://github.com/TrinityCore/TrinityCore/releases

2.2) Create a new directory "db" inside this directory

2.3) Extract the sql inside the downloaded zipped file, and place it in the newly created "db" dir

################################################################

3) Creating the containers

3.1) Create the docker network
./1-create-network.sh

3.2) Create & run the database
./2-create-db.sh

3.3) Create & run the worldserver
./3-create-worldserver.sh

3.4) Update the realmlist ip. Provide the ip or domain that will be used by the WoW client as an argument
./4-update-realmlist-ip.sh 192.168.10.1

3.5) Create & run the authserver
./5-create-authserver.sh
