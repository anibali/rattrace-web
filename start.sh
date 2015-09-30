#!/bin/bash

service cron start

bundle install

bundler_exit_code=$?

if [[ $bundler_exit_code == 0 ]]; then
  if [[ "$RAILS_ENV" == "production" ]]; then
    rake assets:precompile --trace
  fi
  bundle exec whenever --update-crontab
  rails server -b "0.0.0.0"
else
  echo "Bundling failed, did you forget to update Gemfile.lock?"
  exit 1
fi
