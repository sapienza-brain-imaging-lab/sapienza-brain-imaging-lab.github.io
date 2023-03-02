FROM ruby:2.7-alpine3.15
RUN apk update
RUN apk add --no-cache build-base gcc cmake git
ADD Gemfile Gemfile.lock .
RUN bundle install
WORKDIR /site
CMD jekyll serve --host 0.0.0.0 --incremental --livereload
