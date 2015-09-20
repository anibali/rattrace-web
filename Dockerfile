FROM rails:4.2

# Enforce up-to-date Gemfile.lock
RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV BUNDLE_PATH /bundle

RUN apt-get update && apt-get install -y cron postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*

COPY . /usr/src/app

EXPOSE 3000
CMD "./start.sh"
