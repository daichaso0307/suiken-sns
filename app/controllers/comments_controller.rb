class CommentsController < ApplicationController
  def new
    @comment = Comment.find_by(params[:id])
  end
  
  def create
    if @login_user.nil?
      redirect_to '/'
      return
    end
    
    @user = User.find(params[:id])
    
    @comment = Comment.new
    @comment.content = params[:post][:content]
    @comment.user_name = @user.name
    @comment.save
    redirect_to '/'
  end
end
