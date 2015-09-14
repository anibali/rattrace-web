FROM rails:4.2

# Enforce up-to-date Gemfile.lock
RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install

RUN apt-get update && apt-get install -y postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*

COPY . /usr/src/app

RUN rake assets:precompile --trace

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
