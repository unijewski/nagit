namespace :mails do
  desc 'Rake task to send mails'
  task :send => :environment do
    Spambot.send_spam.deliver
  end
end