class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]
  def new
    @post= Post.new
    @post.user_id = current_user.id
  end

  def create
    @post= Post.new(post_params)
    @post.user_id = current_user.id
    if params[:back]
      render:new
    else
      if @post.save
        redirect_to posts_path, notice: "Post was successfully updated."
      else
        render :new
      end 
    end
  end

  def edit
    unless current_user.id == @post.user_id
      redirect_to posts_path, notice: "You are not allowed to do this action"
    end
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "Post was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    unless current_user.id == set_post.user_id
      redirect_to posts_path, notice: "You are not allowed to do this action"
    end
    set_post.destroy
    redirect_to posts_path, notice: "Post was successfully deleted."
  end

  def show
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def confirm
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    render :new if @post.invalid?
  end

  private
  def post_params
    params.require(:post).permit(:content, :image, :image_cache)
  end

  def set_post
    @post = Post.find(params[:id])
  end
  
end
