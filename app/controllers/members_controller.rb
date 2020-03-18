class MembersController < ApplicationController
	before_action:set_params,only: [:edit,:destroy,:update]
	before_action:authenticate_user!
	


	def index
		@search = Member.ransack(params[:q])
		@people = @search.result(distinct: true)
		@result = @people.paginate(:per_page => 5, :page => params[:page])

		respond_to do |format|
      	format.html
      	format.pdf do
        render template: "members/index.html.erb",
        pdf: "temp",
        layout: "pdf.html"
           # Excluding ".pdf" extension.
      end
    end


	end

	def new
		@user=Member.new
	end

	def create
		@user = Member.new(params_permit)
		


		if @user.save 
			@user_log_detail=User.new
			@user_log_detail.email=params[:member][:email]
			@user_log_detail.password="#{params[:member][:email].split('@')[0]}@789"
		
			@user_log_detail.member_id =@user.id
			if  @user_log_detail.save
				ResetPasswordMailer.reset_password(@user).deliver_now
				redirect_to members_path
				flash[:notice]="Member added sucessfully"
			end
		end
	end

	def edit
	end

	def update
  		if @user.update(params_permit)
  			flash[:notice]="Details update successfuly"
  			redirect_to action: "index"
  		else
  			render 'edit'
  		end
  	end


	def destroy
		
  		@user.destroy
  		redirect_to action: "index"
  	end
  	
	private
	def params_permit
	
		params.require(:member).permit(:owner_name, :contact_no, :email, :block,:house_no)
	end

  	def set_params
  		@user=Member.find(params[:id])
  	end


  	

end
