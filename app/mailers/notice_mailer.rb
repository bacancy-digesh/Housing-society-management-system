# frozen_string_literal: true

class NoticeMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.notice.subject
  #
  def notice(user, subject, message)
    @user = user
    @message = message

    mail to: @user.email, subject: subject
  end
end
