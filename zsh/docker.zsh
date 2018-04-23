function docker-clean() {
    docker rmi $(docker images -f "dangling=true" -q)
    docker kill $(docker ps -q); docker rm -vf $(docker ps -aq)
    docker run -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker --rm martin/docker-cleanup-volumes
}
