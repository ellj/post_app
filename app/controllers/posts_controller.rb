class PostsController < ApplicationController
  before_action :require_authentication, only: %i[new create destroy]
  before_action :current_user
  before_action :set_post, only: %i[edit show update]
  before_action :limit_posts_edit_to_authors, only: %i[edit update destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      flash[:success] = 'Your post was added successfully'
      redirect_to post_path(@post)
    else
      flash[:alert] = 'Something went wrong adding your post'
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @post = Post.new
  end

  def destroy
    if @post.destroy
      flash[:success] = 'Your post was deleted successfully'
      redirect_to posts_path
    else
      flash[:error] = 'Your post could not be deleted'
      render :edit, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:success] = 'Post updated successfully'
      redirect_to post_path(@post)
    else
      flash[:alert] = 'Something went wrong with updating your post'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def limit_posts_edit_to_authors
    @post = Post.find(params[:id])
    return unless @post.user_id != @current_user.id

    flash[:alert] = 'You are only permitted to edit your own posts'
    redirect_to posts_path
  end
end
