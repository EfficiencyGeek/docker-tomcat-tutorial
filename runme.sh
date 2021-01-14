#!/bin/bash

COMPOSE_FILE="docker-compose.yml"

start() {
    docker-compose -f docker-compose.yml up --build
# https://github.com/docker/compose/issues/1049
#    docker-compose build --force-rm --no-cache && docker-compose up --detach && docker-compose logs -f    
#    docker-compose --file docker-compose.yml build --force-rm --no-cache && docker-compose up --detach && docker-compose logs -f    
}

bash () { 
    docker exec -it mywebapp /bin/bash 
}

stop() {
    docker-compose -f docker-compose.yml down
}

rebuild-service() {
    SERVICENAME="$1"
    docker-compose build --force-rm --no-cache $SERVICENAME && docker-compose up $SERVICENAME
}

reset() {
    # delete prior state
    # force a redownload of docker images.
    delete-containers
    delete-volumes
    delete-images
}

delete-containers() {
    # delete containers
    docker rm -f mysql civicrm
}

delete-volumes() {
    # delete volumes
    docker volume rm $(docker volume ls | grep civicrm)
    #docker volume rm mysqldb-vol civicrm-modules civicrm-profiles civicrm-themes civicrm-sites civicrm-backup civicrm-private
}

delete-images() {
    docker rmi $(docker images | grep civicrm)
}

usage() {
    cat $0 | grep '()'
}

test-civi() { 
    ## delete any prior image    
    docker rmi civicrm 

    docker build -t civicrm civicrm/.  
 }

bash-civi() { 
    docker exec -it civicrm /bin/bash 
}

main() {
    cmd="$*"
    cmd=${cmd:=usage}
#    start
    #usage
    $cmd

}
set -x
main $*