class TenantsController < ApplicationController
	before_action:set_params,only: [:edit,:destroy,:update]
	 before_action:authenticate_user!
	def index
		@search = Tenant.ransack(params[:q])
		@people = @search.result(distinct: true)
		@result = @people.paginate(:per_page => 5, :page => params[:page])
	end


	def new
		@tenant=Tenant.new
	end

	def create
    @tenant = Tenant.new(params_permit)
    user= Member.where(block: params[:owner_block], house_no: params[:owner_house_no])
    @tenant.member_id = user.first.id


    if @tenant.save 
      redirect_to tenants_path
      flash[:notice]="Tenant added sucessfully"
    end
	end

	def search
    @member=Member.find_by(house_no:  params[:owner_house_no],block: params[:owner_block])

    render json: { owner: @member }
	end

	def edit
	end

	def update
  		if @tenant.update(params_permit)
  			flash[:notice]="Details update successfuly"
  			redirect_to action: "index"
  		else
  			render 'edit'
  		end
  	end


	def destroy
  		@tenant.destroy
  		redirect_to action: "index"
  end

  	private

  	def set_params
  		@tenant=Tenant.find(params[:id])
  	end
    def params_permit
      params.require(:tenant).permit(:tenant_name, :contact_no)
    end

end
