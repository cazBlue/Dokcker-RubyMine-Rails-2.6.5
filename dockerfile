FROM ruby:2.6.5-stretch
RUN apt-get update -qq && apt-get install -y postgresql-client

#install node v10, required for Ruby 2.6 web packer
#https://github.com/nodesource/distributions
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

#install Yarn for latest version of rails
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

#install rails gems, these could be injected into the Gemfile as well...
RUN gem install rails
RUN gem install rake
RUN gem install ruby-debug-ide
RUN gem install debase

#Create app specifics
#Note an empty Gemfile and Gemfile.lock are required for first run
RUN mkdir /myapp
WORKDIR /myapp
#RUN touch Gemfile
#RUN touch Gemfile.lock
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install
#COPY . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

# Start the main process.
#CMD ["rails", "server", "-b", "0.0.0.0"]