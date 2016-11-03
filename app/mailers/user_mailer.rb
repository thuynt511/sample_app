class UserMailer < ApplicationMailer

<<<<<<< HEAD
  def account_activation(user)
=======
  def account_activation user
>>>>>>> account-activation
    @user = user
    mail to: user.email, subject: t("user_mailer.account_activation")
  end

  def password_reset
    @greeting = t("user_mailer.password_reset")
<<<<<<< HEAD

=======
>>>>>>> account-activation
    mail to: "to@example.org", subject: t("user_mailer.password_reset")
  end
end
