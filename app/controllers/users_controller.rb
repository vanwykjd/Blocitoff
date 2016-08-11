class UsersController < ApplicationController
	before_action :sign_in

	
	def show
		@user = User.find(params[:id] || current_user.id)
		@items = @user.items
	end
	
	
end