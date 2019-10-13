rm -f tmp/pids/server.pid

cd /myapp

if [ ! -d "/myapp/app" ]; then  
  echo "Rails app not found, creating a new one"

  #gem install rails
  #gem install rake
  #gem install ruby-debug-ide
  #gem install debase

  rails new . --force --database=postgresql --skip-git
  #override the default config with one linked to dockerised postgress
  cp database.docker.config.yml ./config/database.yml
  rails db:create
  #bundle install

  echo "Rails app and gems created, run again to launch server"
fi

if [ -d "/myapp/app" ]; then
  #bring up the server
  rails s -p 3000 -b '0.0.0.0'
fi

