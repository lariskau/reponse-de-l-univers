class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to "/secret"
    else
      flash.now[:danger] = "Ton login ou ton mot de passe est invalide !"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to "/"
  end

end
