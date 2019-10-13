# Docker-RubyMine-Rails-2.6.5
Ruby 2.6.5 docker-compose configuration with RubyMine debugging

# NEW PROJECT

## 1: Build docker container, this will setup rails and debug gems + compatible versions of Node + Yarn

    docker-compose build --no-cache

## 2: Bring the project up

    docker-compose up
On first run boostrap.sh checks if app director exists, if not rails new is run. Database config also updated to point at docker hosted postgres

## Rubymine interpreter can now be set to use docker-compose and spun up
https://blog.jetbrains.com/ruby/2019/03/rubymine-docker/#use_docker_docker_compose_as_a_remote_interpreter


### Resources
Modified from guide here: https://docs.docker.com/compose/rails/
For Ruby 2.6.5, Node 10 and Yarn for debugging in Rubymine

Postgres:
https://hub.docker.com/_/postgres

External DB Volume mounts for Postrgres windows work around
  https://forums.docker.com/t/trying-to-get-postgres-to-work-on-persistent-windows-mount-two-issues/12456
  
