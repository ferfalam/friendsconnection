class PostsController < ApplicationController
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
  end

  def destroy
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
  end

  def confirm
  end

  private
  def post_params
    params.require(:post).permit(:content, :image, :image_cache)
  end
end
