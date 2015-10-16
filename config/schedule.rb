env :GEM_PATH, ['/usr/local/bundle', Bundler.bundle_path.to_s, *Gem.path].uniq.join(':')
env :SECRET_KEY_BASE, ENV['SECRET_KEY_BASE']
env :DB_PORT_5432_TCP_ADDR, ENV['DB_PORT_5432_TCP_ADDR']
env :POSTGRES_USER, ENV['POSTGRES_USER']
env :POSTGRES_PASSWORD, ENV['POSTGRES_PASSWORD']
env :MAILCATCHER_PORT_1025_TCP_ADDR, ENV['MAILCATCHER_PORT_1025_TCP_ADDR']
env :MAILCATCHER_PORT_1025_TCP_PORT, ENV['MAILCATCHER_PORT_1025_TCP_PORT']
# TODO: Productiom mail environment variables here

set :environment, ENV['RAILS_ENV']
set :bundle_command, '`which bundle` exec'
set :output, 'log/cron.log'

# Periodically generate and send notifications
every 1.minute do
  rake 'notifications:send'
end
