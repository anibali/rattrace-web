FROM rails:4.2

# Enforce up-to-date Gemfile.lock
RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install

COPY . /usr/src/app

RUN apt-get update && apt-get install -y sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*

# TODO: Move all of this to external config
ENV UDP_USER udp_server
ENV UDP_PASS super_secret_password

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
