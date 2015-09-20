#!/bin/bash

bundle install

bundler_exit_code=$?

if [[ $bundler_exit_code == 0 ]]; then
  rake assets:precompile --trace
  rails server -b "0.0.0.0"
else
  echo "Bundling failed, did you forget to update Gemfile.lock?"
  exit 1
fi
