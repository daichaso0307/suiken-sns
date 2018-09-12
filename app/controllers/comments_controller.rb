class CommentsController < ApplicationController
  before_action :get_login_user
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new
    @comment.post_id = params[:post_id]
    @comment.content = params[:content]
    @comment.user_name = User.find_by(cookies[:user_id])
    @comment.save
    redirect_to '/posts/#{post.id}'
  end
end
