class FollowingController < ApplicationController
  def index
    @title = t("title.following")
    @user  = User.find_by id: params[:id]
    @users = @user.following.paginate page: params[:page]
    render :show_follow
  end
end
