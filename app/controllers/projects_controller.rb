class ProjectsController < ApplicationController

	before_action :set_project, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@projects = Project.all
	end

	def show

	end 

	def update
		@project = Project.find.(params[:id])
		@project.update(project_params)
		redirect_to  @project


	end


	def edit
		@project = Project.find(params[:id])

	end


	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		@project.user = current_user

		if @project.save
			redirect_to @project
		else
			render :new
		end		

	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		redirect_to projects_path

	end

	private 
		def set_project
			@projects = Project.find(params[:id])
		end 

		def project_params
			params.require(:project).permit(:title, :description, :price, :is_remote, :user_id)
		end 





end
