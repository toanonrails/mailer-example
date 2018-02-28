require 'test_helper'

class HomeMailerTest < ActionMailer::TestCase
  test "welcome" do
    mail = HomeMailer.welcome
    assert_equal "Welcome aboard!", mail.subject
    assert_equal ["user@example.org"], mail.to
    assert_equal ["noreply@sampleapp.com"], mail.from
    assert_match "Welcome", mail.body.encoded
  end

end
