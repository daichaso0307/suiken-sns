class PostsController < ApplicationController
  before_action :get_login_user
  
  def new
    @post = Post.new
  end
  
  def create
    if @login_user.nil?
      redirect_to '/'
      return
    end
    
    @user = User.find_by(id: @login_user.id)
    
    @post = Post.new
    @post.content = params[:post][:content]
    @post.title = params[:post][:title]
    @post.user_id = @login_user.id
    @post.user_name = @user.name
    @post.save
    redirect_to '/'
  end
  
  def show
    @detail = Post.find(params[:id])
  end
  
  def destroy
    Post.find(params[:id]).destroy
    redirect_to '/'
  end
end
