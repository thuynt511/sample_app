require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "account_activation" do
    user = users(:michael)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal I18n.t("user_mailer.account_activation"), mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match user.name,               mail.body.encoded
    assert_match user.activation_token,   mail.body.encoded
    assert_match CGI.escape(user.email),  mail.body.encoded
  end

  test "password_reset" do
    user = users(:michael)
    user.reset_token = User.new_token
    mail = UserMailer.password_reset(user)
    assert_equal I18n.t("user_mailer.password_reset"), mail.subject
    assert_equal ["michael@example.com"], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match I18n.t("user_mailer.password_reset"), mail.body.encoded
  end

end
