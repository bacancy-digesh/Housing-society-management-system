class Member < ApplicationRecord
	resourcify
	has_many :visitors
	has_many :vehicals
	has_many :tenants, dependent: :destroy
	has_many :payment_records
	has_many :complains
	

	def self.monthly_mail
		@current_maintenance= Maintenance.last.amount
		@final_amount=0
		@expense =	Expense.where(date: DateTime.current.beginning_of_month..DateTime.current.end_of_month)
		@expense.each do |e|
			@final_amount+= e.amount
		end
		users =Member.all
		users.each do |u|
			temp=PaymentRecord.new
			temp.member_id=u.id
			temp.total_month_maintanence= (@current_maintenance + @final_amount)
			temp.date_of_maintanance= DateTime.current.to_date
			temp.save
			puts @expense
			MonthlyMaintenanceMailer.monthly_mailer(u,@current_maintenance,@expense,@final_amount).deliver_now
		end
	end
end
