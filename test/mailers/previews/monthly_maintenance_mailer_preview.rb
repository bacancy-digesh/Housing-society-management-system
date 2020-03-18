# Preview all emails at http://localhost:3000/rails/mailers/monthly_maintenance_mailer
class MonthlyMaintenanceMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/monthly_maintenance_mailer/monthly_mailer
  def monthly_mailer
    MonthlyMaintenanceMailer.monthly_mailer
  end

end
