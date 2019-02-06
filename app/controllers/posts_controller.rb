class PostsController < ApplicationController
  before_action :require_login

  def new
    # @post = Post.new
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = current_user.posts.find(params[:id])
  end

  
  def update
    @post = current_user.posts.find(params[:id])
    if @post.update_attributes(post_params) 
      redirect_to sub_url(@post.sub_id)
    else 
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end 
  end

   def create
    @post = Post.new(post_params)
    @post.sub_id = params[:sub_id]
    @post.user_id = current_user.id
    if @post.save 
      redirect_to sub_url(@post.sub_id)
    else 
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end 
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end

  def post_params
    params.require(:post).permit(:title, :url, :content)
  end
end
