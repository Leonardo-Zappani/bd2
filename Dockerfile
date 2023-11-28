FROM ruby:3.1.2-buster

RUN apt-get update -qq && apt-get install -y postgresql-client

RUN curl -sL https://deb.nodesource.com/setup_19.x | bash -\
  && apt-get update -qq && apt-get install -qq --no-install-recommends \
    nodejs \
  && apt-get upgrade -qq \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*\
  && npm install -g yarn@1

RUN yarn add esbuild
RUN yarn add sass

WORKDIR /trabalho_bd2
COPY Gemfile /trabalho_bd2/Gemfile
COPY Gemfile.lock /trabalho_bd2/Gemfile.lock

EXPOSE 3000

RUN bundle install
