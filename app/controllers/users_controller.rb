# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :get_user
  def index
    maintanence_of_current_month = PaymentRecord.where(date_of_maintanance:
                                  DateTime.current.beginning_of_month..
                                  DateTime.current.end_of_month,
                                                       member_id: @@user.id)
    @user = @@user
    if maintanence_of_current_month.first.status == false
      @current_month_maintenance_status = 'Pendding'
    else
      @current_month_maintenance_status = 'Paid'
    end
    @maintanence_of_current_month_amount = maintanence_of_current_month.first.total_month_maintanence
    @maintenance_amount = Maintenance.last.amount
    @pendding_complain = Complain.where(status: false, member_id: @@user.id)
    @all_complain = Complain.where(member_id: @@user.id)
    @visitors = Visitor.where(member_id: @@user.id)
    @vehicles = Vehical.where(member_id: @@user.id)
    @all_maintanence=PaymentRecord.where(member_id: @@user.id)
  end

  def complain
    complain = Complain.new(params.permit(:subject, :description))
    complain.member_id = @@user.id
    if complain.save
      redirect_to users_path
      flash[:notice] = 'Complain submmited successfully'
    end
  end

  private

  def get_user
    @@user = Member.find_by(email: current_user.email)
  end
end
