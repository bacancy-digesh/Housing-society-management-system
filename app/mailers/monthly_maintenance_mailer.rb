class MonthlyMaintenanceMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.monthly_maintenance_mailer.monthly_mailer.subject
  #
  def monthly_mailer(user,current_maintenance,expense,final_amount)
    @user=user
    @current_maintenance=current_maintenance
    @expense = expense
    @final_amount=final_amount
    mail to: @user.email,subject: "Monthly Maintenance"
  end

end
