FROM ruby:2.2
MAINTAINER Hannes Schaller <admin@cyberkov.at>


ENV OPENHAB_SERVER="localhost" OPENHAB_PORT="7070"

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev libstdc++6
#RUN gem install eventmachine -v '1.0.3'
RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
#ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install
ADD . /app

EXPOSE 3030
CMD ["bundle", "exec", "dashing", "start"]
