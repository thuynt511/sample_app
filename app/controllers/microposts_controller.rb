class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @micropost = current_user.microposts.build(correct_post)
    if @micropost.save
      flash[:success] = t("message.micropost_created")
      redirect_to root_url
    else
      @feed_items = []
      render "static_pages/home"
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = t("flash.micropost_deleted")
    redirect_to request.referrer || root_url
  end

  private
  def correct_post
    params.require(:micropost).permit(:content, :picture)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end
