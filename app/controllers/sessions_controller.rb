class SessionsController < ApplicationController
  def new
  end

	def create
		user = User.authenticate(params[:username],params[:password])
		if user
			session[:user_id] = user.id
			redirect_to albums_path, :notice => "You have successfully signed in!"
		else
			flash.now.alert = "Invalid email or password"
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "You have successfully signed out!"
	end
end
