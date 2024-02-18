#!/usr/bin/env bash

set -e

echo -e "\nThe current prompt will disappear after 30 seconds if no reponse\n"

while true
    do
        echo -e "\nChoose from the below list an action to combine with \"docker compose ...\"\n"
        echo -e "1. \"build\": Will build the current compose set\n"
        echo -e "2. \"up\": Will bring up the current compose set\n"
        echo -e "3. \"down\": Will bring down the current compose set with its volumes\n"
        echo -e "4. \"ls\": Will list the current compose set\n"
        echo -e "5. \"imagec\": Will list the images created by this compose\n"
        echo -e "6. \"images\": Will list all images from docker\n"
        echo -e "7. \"ps\": Will show the containers created by this compose\n"
        echo -e "8. \"top\": Will display the containers running processes created by this compose\n"
        echo -e "9. \"rmi\": Will images after you bring down the containers\n"
        echo -e "10. \"volumes\": Will remove all volumes\n"
        echo -e "11. \"prune\": Will clean up docker system\n"
        echo -e "12. \"exit\": Will exit the current program\n"
        
        read -t 30 state
            case $state in
                build)
                    echo -e "Building compose\n"
                    docker compose build
                    ;;
                up)
                    echo -e "Bringing up services\n"
                    docker compose up -d
                    sleep 5
                    echo -e "Your application is running at http://$(hostname -I | awk -F" " '{print $1}'):$(docker compose ps | awk -F" " '{print $NF}' | awk -F":" '{print $NF}'| cut -c 1-4 | head -n 2 | tail -n 1)\n"
                    ;;
                down)
                    echo -e "Bringing down docker compose set with its volume(s)\n"
                    docker compose down --volumes
                    ;;
                ls)
                    echo -e "Listing docker compose set\n"
                    docker compose ls
                    ;;
                imagec)
                    echo -e "Listing docker compose image\n"
                    docker compose images 
                    ;;
                images)
                    echo -e "Listing all docker images\n"
                    docker images 
                    ;;
                ps)
                    echo -e "Listing all docker compose containers\n"
                    docker compose ps 
                    ;;
                top)
                    echo -e "Listing running process from compose containers\n"
                    docker compose top 
                    ;;
                rmi)
                    echo -e "Removing all containers images\n"
                    docker rmi $(docker images -a -q) 
                    ;;
                volumes)
                    echo -e "Removing all volumes\n"
                    docker volume prune -f 
                    ;;
                prune)
                    echo -e "Clean up the system\n"
                    docker system prune -f --filter until=2h
                    ;;
                exit)
                    echo -e "Bye\n"
                    exit 0
                    ;;
                *)
                    echo -e "For anything else, please run \"docker compose --help\"\n"
                    exit 1
                    ;;
            esac
    done