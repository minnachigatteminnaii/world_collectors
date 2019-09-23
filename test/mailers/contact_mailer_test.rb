require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "reply_user" do
    mail = ContactMailer.reply_user
    assert_equal "Reply user", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
