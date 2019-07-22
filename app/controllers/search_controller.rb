class SearchController < ApplicationController
	def index
		keyword = "%#{params[:q]}"

		@projects = Project.where("title LIKE ? OR description LIKE ?" , keyword, keyword)
	end
end	
