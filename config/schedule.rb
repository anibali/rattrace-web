env :GEM_PATH, ['/usr/local/bundle', Bundler.bundle_path.to_s, *Gem.path].uniq.join(':')
env :SECRET_KEY_BASE, ENV['SECRET_KEY_BASE']

set :environment, ENV['RAILS_ENV']
set :bundle_command, '`which bundle` exec'
set :output, 'log/cron.log'

# Periodically generate and send notifications
every 1.minute do
  rake 'notifications:send'
end
