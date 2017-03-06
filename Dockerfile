FROM ruby:2.3

# General Dev
RUN apt-get update
RUN apt-get install -y build-essential

# Postgres drivers
RUN apt-get install -y libpq-dev

# For JS Runtime
RUN apt-get install -y nodejs

# Project things
RUN mkdir /finalproject
WORKDIR /finalproject
ADD Gemfile /finalproject/Gemfile
RUN bundle install
ADD . /finalproject