class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]
  def new
    @post= Post.new
  end

  def create
    @post= Post.new(post_params)
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end 
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "Post was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    set_post.destroy
    redirect_to posts_path, notice: "Post was successfully deleted."
  end

  def show
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def confirm
  end

  private
  def post_params
    params.require(:post).permit(:content, :image, :image_cache)
  end

  def set_post
    @post = Post.find(params[:id])
  end
  
end
