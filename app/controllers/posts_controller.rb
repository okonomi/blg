class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def index
    @posts = authorize Post.all
  end

  def new
    @post = authorize Post.new
  end

  def create
    authorize Post
    Post.create(post_params)
  end

  def show
  end

  def edit
  end

  def update
    @post.update(post_params)
  end

  def destroy
    @post.delete
  end

  private

  def set_post
    @post = authorize Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
