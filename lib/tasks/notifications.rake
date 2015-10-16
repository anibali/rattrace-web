namespace :notifications do
  desc 'Generate and send any unsent trap maintenance notifications'
  task send: :environment do
    notifier = Notifier.new
    notifier.send_notifications
    puts "Finished mailout"
  end
end
