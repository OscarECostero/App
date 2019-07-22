class UsersController < ApplicationController
	def index
		redirect_to new_user_path
	end	

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to root_path, notice: "su cuenta se creo correctamente"
		else
			render	:new
		end	

	end	

	private 
		def user_params
			params.require(:user).permit(:email, :password, :name, :last_name, :username, :country, :date_of_birth)
		end	

end
