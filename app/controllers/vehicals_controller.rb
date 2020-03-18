class VehicalsController < ApplicationController
	def search
		@vehical = Vehical.find_by(vehical_no: params[:vehical_no])
		
		if @vehical.parking_slot == nil
			@slot = "Not Allocate"
		else
			@slot= @vehical.parking_slot.slot
		end
		render :index, object: @vehical
	end
	def index
	end

	def vehical_slot
		
		vehical_slot= ParkingSlot.new(params.permit(:slot))
		vehical = Vehical.find_by(vehical_no: params[:vehical])
		vehical_slot.vehical_id= vehical.id
		if vehical_slot.save
			flash[:notice]="Data Added suscessfully"
			redirect_to vehicals_path
		end

	end

	def destroy
		
		@vehical=Vehical.find(params[:id])
		@vehical.destroy
  		redirect_to action: "index"
	end

	def create
		@vehical= Vehical.new
		@vehical.vehical_no=params[:vehical_no]
		@vehical.description=params[:description]
		user= Member.where(block: params[:owner_block], house_no: params[:owner_house_no])
    	@vehical.member_id = user.first.id
    	if @vehical.save
    		flash[:notice]="Data Added suscessfully"
    		redirect_to vehicals_path
    	end

	end
	private
	def params_permit
		
      params.require(:vehical).permit(:vehical_no,:description)
    end
end
