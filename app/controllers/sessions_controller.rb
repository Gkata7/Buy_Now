class SessionsController < ApplicationController
	def create
 		@user = User.find_by(email:params[:email].downcase)
		if @user && @user.authenticate(params[:password])
				session[:id] = @user.id
				redirect_to "/products"
		else
			flash[:errors] = "Invalid email/passaword"
			redirect_to "/users"
		end
	end

	def destroy
		reset_session
		redirect_to "/users"
	end

end
