class CommentsController < ApplicationController
  before_action :get_login_user
  def new
    @comment = Comment.new
  end
  
  def create
    if @login_user.nil?
      redirect_to '/'
      return
    end
    
    @comment = Comment.new
    @comment.content = params[:post][:content]
    @comment.user_name = @login_user.name
    @comment.save
  end
end
