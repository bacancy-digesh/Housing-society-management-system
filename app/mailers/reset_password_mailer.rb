# frozen_string_literal: true

class ResetPasswordMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reset_password_mailer.reset_password.subject
  #
  def reset_password(user)
    @user = user
    @password = "#{@user.email.split('@')[0]}789"

    mail to: @user.email, subject: 'YOUR REGISTRATION IS DONE'
  end
end
