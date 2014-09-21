require 'test_helper'

class SpambotTest < ActionMailer::TestCase
  test "sent_spam" do
    mail = Spambot.sent_spam
    assert_equal "Sent spam", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
