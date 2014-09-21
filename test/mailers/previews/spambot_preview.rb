# Preview all emails at http://localhost:3000/rails/mailers/spambot
class SpambotPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/spambot/sent_spam
  def sent_spam
    Spambot.sent_spam
  end

end
