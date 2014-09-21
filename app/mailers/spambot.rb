class Spambot < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.spambot.sent_spam.subject
  #
  def send_spam(naggers)
    mail to: naggers.map(&:email), subject: 'Top 5 complaints'
  end
end
