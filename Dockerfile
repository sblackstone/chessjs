# Base image
FROM ruby:2.3.1-alpine

ENV HOME /app

WORKDIR $HOME

RUN \
  apk update -qq && \
  apk add build-base nodejs git bash tzdata

ADD Gemfile $HOME
ADD Gemfile.lock $HOME


RUN \
  bundle install

RUN \
  rm -rf vendors/cache/* && \
  apk del build-base git
  
ADD . $HOME