class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	helper_method :current_user, :user_signed_in?, :authenticate_user!

	private
		def current_user
			@current_user ||= User.find_by(id: session[:user_id])
		end
		
		def user_signed_in?
			current_user
		end	 

		def authenticate_user!
			if user_signed_in?

			else
				redirect_to new_session_path
			end	
		end	
end


