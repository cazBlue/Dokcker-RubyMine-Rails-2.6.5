# Docker-RubyMine-Rails-2.6.5
Ruby 2.6.5 docker-compose configuration with RubyMine debugging

# NEW PROJECT
## 1: Create a blank Gemfile & Gemfile.lock

## 2: Build docker container, this will setup rails and debug gems + compatible versions of Node + Yarn

docker-compose build --no-cache

## 3: build rails app
docker-compose run web rails new . --force --database=postgresql --skip-git && bundle

## 4: Configure database
docker-compose run web rake db:create

OR

"docker exec -it sh" and run "rails db:create"

## update rails config to point at dockerised postgres
https://docs.docker.com/compose/rails/#connect-the-database

Rubymine interpreter can now be set to use docker-compose and spun up
https://blog.jetbrains.com/ruby/2019/03/rubymine-docker/#use_docker_docker_compose_as_a_remote_interpreter


### Resources
Modified from guide here: https://docs.docker.com/compose/rails/
For Ruby 2.6.5, Node 10 and Yarn for debugging in Rubymine
External DB Volume mounts for Postrgres windows work around
  https://forums.docker.com/t/trying-to-get-postgres-to-work-on-persistent-windows-mount-two-issues/12456
  
