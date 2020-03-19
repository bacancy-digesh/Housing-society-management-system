# frozen_string_literal: true

class VisitorsController < ApplicationController
  def create
    member = Member.find_by(house_no: params[:owner_house_no], block: params[:owner_block])
    if member== nil
    	flash[:alert]="Select BLOCK AND House No."
    	redirect_to visitors_path
    else
    visitor = Visitor.new(params.permit(:name, :contact_no, :description))
    visitor.member_id = member.id
    if visitor.save
      redirect_to visitors_path
      flash[:notice] = 'Visitor entry is done'
    end
	end	
  end
end
