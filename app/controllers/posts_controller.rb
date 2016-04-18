class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:edit, :show, :update, :destroy]

  def index
    @posts = current_user.posts.all
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: 'Your post has been saved'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Your post has been updated!'
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'That post has been destroyed'
  end

  private
  def post_params
    params.require(:post).permit(:body)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
