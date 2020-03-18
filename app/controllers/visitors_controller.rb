class VisitorsController < ApplicationController
	def create
		
		member=Member.find_by(house_no:  params[:owner_house_no],block: params[:owner_block])
		visitor = Visitor.new(params.permit(:name,:contact_no,:description))
		visitor.member_id = member.id
		if visitor.save
			redirect_to visitors_path
			flash[:notice]= "Visitor entry is done"
		end
	end
end
