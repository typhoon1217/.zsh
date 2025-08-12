#basic docker 
alias d='docker'
alias di='docker images'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias drmi='docker rmi'
alias drm='docker rm'
alias drmc='docker rm -f $(docker ps -aq)'
alias drmiac='docker rmi -f $(docker images -aq)'
alias dstop='docker stop $(docker ps -aq)'
alias dstart='docker start'
alias dattach='docker attach'
alias dlogs='docker logs'
alias dlogsf='docker logs -f'
alias dinspect='docker inspect'
alias dexec='docker exec -it'
alias dbuild='docker build -t'
alias drun='docker run'
alias dvol='docker volume ls'
alias dnw='docker network ls'

#docker compose
alias dc='docker compose'
alias dcu='docker compose up'
alias dcud='docker compose up -d'
alias dcd='docker compose down'
alias dcr='docker compose run --rm'
alias dce='docker compose exec'
alias dcps='docker compose ps'
alias dcl='docker compose logs'
alias dclf='docker compose logs -f'
alias dcrestart='docker compose restart'
alias dcpull='docker compose pull'
alias dcb='docker compose build'
alias dcstop='docker compose stop'


# Remove all stopped containers
alias dclean-containers='docker container prune'

# Remove all dangling images
alias dclean-images='docker image prune'

# Remove all dangling volumes
alias dclean-volumes='docker volume prune'

# Full cleanup (removes everything except volumes)
alias dclean='docker system prune -af'

# Full cleanup including volumes
alias dcleanall='docker system prune -af --volumes'

# Docker Swarm
alias dsw='docker swarm'
alias dswi='docker swarm init'
alias dswj='docker swarm join'
alias dswl='docker swarm leave'
alias dswls='docker node ls'
alias dswu='docker node update'
alias dswps='docker service ps'
alias dsws='docker service ls'
alias dswd='docker stack deploy -c'
alias dswrm='docker stack rm'
alias dswc='docker config ls'
alias dswsec='docker secret ls'
alias dswp='docker node promote'
alias dswdm='docker node demote'
alias dswr='docker node rm'

alias docker-h="cat ~/.config/.zsh/aliases/docker.zsh"
