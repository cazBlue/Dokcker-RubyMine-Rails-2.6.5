rm -f tmp/pids/server.pid

if [ ! -d "/myapp/app" ]; then
  cd /myapp
  echo "Rails app not found, creating a new one"
  rails new . --force --database=postgresql --skip-git
  #override the default config with one linked to dockerised postgress
  cp database.docker.config.yml ./config/database.yml
  rails db:create
fi
#bring up the server
rails s -p 3000 -b '0.0.0.0'