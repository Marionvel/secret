class UsersController < ApplicationController

	def show
		@user = User.find(session[:user_id])
	end

	def new
		@user = User.new
		@user.save
	end

	def create
		@user = User.new(user_params)
    	if @user.save
    	  log_in @user
    	  flash[:success] = "Welcome to the Sample App!"
		  redirect_to @user
		else
		  flash[:danger] = "Il y a un probléme sur ton mail/mot de passe"
		  render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update (var_params)
	end

	def destroy
		@user = User.find(params[:id]).destroy
		render 'new'
	end

	


private

	def user_params
	params.require(:user).permit(:email, :password, :password_confirmation)
	end

end
