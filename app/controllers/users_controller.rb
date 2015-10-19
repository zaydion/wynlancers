class UsersController < ApplicationController

	def new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "Welcome to the wonderful world of Wynlancers!"
			redirect_to "/"
		else
			flash[:alert] = "We ran into some trouble creating you account. Please try again."
			redirect_to :back
		end
	end

	private

	def user_params
		params.require(:user).permit(:email, :password, :password_comfirmation)
	end

end
