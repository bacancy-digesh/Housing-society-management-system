class ApplicationController < ActionController::Base
	private
	def after_sign_in_path_for(resource)
		if current_user.has_role? :admin
			return home_dashbords_path
		elsif current_user.has_role? :watchman
			return visitors_path
		else
			return users_path
		end
	end

end
