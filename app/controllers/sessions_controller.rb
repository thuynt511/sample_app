class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
<<<<<<< HEAD
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message  = t("en.flash.warning")
=======
        params[:session][:remember_me] == "1" ? remember(user) : forget(user)
        redirect_back_or user
      else
        message  = t("flash.warning")
>>>>>>> account-activation
        flash[:warning] = message
        redirect_to root_url
      end
    else
<<<<<<< HEAD
      flash.now[:danger] = t("en.flash.danger")
      render:new
=======
      flash.now[:danger] = t("flash.danger")
      render :new
>>>>>>> account-activation
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
