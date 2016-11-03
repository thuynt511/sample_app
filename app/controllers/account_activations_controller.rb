class AccountActivationsController < ApplicationController
  def edit
<<<<<<< HEAD
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = t("en.flash.success")
      redirect_to user
    else
      flash[:danger] = t("en.flash.danger")
=======
    user = User.find_by email: params[:email]
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = t("flash.success")
      redirect_to user
    else
      flash[:danger] = t("flash.danger")
>>>>>>> account-activation
      redirect_to root_url
    end
  end
end
