class FollowsController < ApplicationController
  before_action :get_login_user
  def create
    @follow = Follow.new
    @follow.user_id = cookies[:user_id]
    @follow.following_user_id = params[:id]
    @follow.save
    redirect_to '/users'
  end
  
  def destroy
    @follow = Follow.find_by(params[:id])
    @follow.destroy
    @follow.save
    redirect_to '/users'
  end
end
