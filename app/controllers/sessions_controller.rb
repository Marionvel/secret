class SessionsController < ApplicationController

  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
   		log_in user
      flash[:success] = "Tu es maintenant connecté(e) !"
    	redirect_to user
    else
      flash.now[:danger] = "invalid email/password combination"
   		 render :error, template: 'pages/error'
	end
  end

  def destroy
     log_out
     redirect_to root_url
  end

end
