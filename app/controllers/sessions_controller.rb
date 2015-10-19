class SessionsController < ApplicationController
	def new
	end

	def create
  	## the code below will try to authenticate the user, if successful an instance of the User model is returned
  	@user = User.authenticate(params[:email], params[:password])
  	## so if successful and @user exist(not nil) flash success
  	if @user
  		flash[:notice] = "You are now logged in."
    	## log the user in by storing their ID in the session hash with the [:user_id] key
    	session[:user_id] = @user.id
    	##redirects them to homepage
    	redirect_to "/"
    else
    	## password incorrect or user doesn't exist
    	flash[:alert] = "Log in failed. Please, don't drink and type."
    	redirect_to new_user_path
    end
  end

  def destroy
  	session[:user_id] = nil
  	flash[:notice] = "You've been logged out successfully"
  	redirect_to "/"
  end
end
