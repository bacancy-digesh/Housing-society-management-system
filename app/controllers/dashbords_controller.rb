class DashbordsController < ApplicationController

	def home
		@member_count= Member.count
		@tenant=Tenant.count
		@maintenance_amount=Maintenance.last
		@maintenance=Maintenance.new
		@pendding_maintanence_of_current_month =PaymentRecord.where(date_of_maintanance: DateTime.current.beginning_of_month..DateTime.current.end_of_month,status: false).count
		@latest_complain = Complain.where(created_at: DateTime.current.beginning_of_day..DateTime.current.end_of_day)
		@pendding_complain = Complain.where(status: false)
		@all_complain=Complain.all
	end

	def index
		redirect_to new_user_session_path
	end

	def create
		@maintenance=Maintenance.new(params.permit(:amount))
		if @maintenance.save
			redirect_to dashbord_path
		end
	end


end
