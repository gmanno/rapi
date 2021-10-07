FROM ruby:latest

LABEL maintainer="germano.carv@gmail.com"

RUN apt update && apt -y install ruby-dev build-essential nodejs ruby-execjs libpq-dev

WORKDIR /usr/src/app
RUN gem install bundler

COPY Gemfile ./
RUN bundle install

COPY . .

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
