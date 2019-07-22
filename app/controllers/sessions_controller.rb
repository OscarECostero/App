class SessionsController < ApplicationController
  def new
  end

  def show
  	@projects = Project.all
  end	

  def create 
  	user = User.find_by_email(params[:email])

  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to root_path, notice: "inicio sesion correctamente"
  	else
  		flash.now[:alert] = "correo o contraseña incorrecto"
  		render :new
  	end	

  end

  def destroy 
  	session.delete(:user_id)
  	redirect_to new_user_path, notice: "Cerro sesion correctamente"
  end			

end
 