class PostsController < ApplicationController
  before_action :get_login_user
  
  def new
    @post = Post.new
  end
  
  def index
    @posts = []
    @posts = Post.all
    @posts = @posts.order("created_at desc")
  end
  
  def create
    if @login_user.nil?
      redirect_to '/'
      return
    end
    
    @user = User.find_by(id: @login_user.id)
    
    @post = Post.new
    @post.content = params[:content]
    @post.title = params[:title]
    @post.user_id = @login_user.id
    @post.user_name = @user.name
    @post.save
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/")
    else
      render("posts/new")
    end
  end
  
  def show
    @detail = Post.find(params[:id])
    
    @comments = []
    @comments = Comment.where(post_id: @detail.id)
    @comments = @comments.order("created_at desc")
  end
  
  def destroy
    Post.find(params[:id]).destroy
    redirect_to '/'
  end
end
