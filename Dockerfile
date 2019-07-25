FROM ruby:2.6.3

ENV LANG C.UTF-8

RUN mkdir /myapp
WORKDIR /myapp

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN gem install bundler \
  && bundle config --global retry 5 \
  && bundle config --global jobs 4

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp
