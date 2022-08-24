class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  # after_action :verify_authorized

  def index
    @posts = authorize Post.includes(:rich_text_content).published.latest

    respond_to do |format|
      format.html
      format.atom
    end
  end

  def new
    @post = authorize Post.new(published_at: Time.current)
  end

  def create
    authorize Post
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: t("flash.post_created")
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: t("flash.post_updated")
    end
  end

  def destroy
    if @post.delete
      redirect_to root_path, notice: t("flash.post_destroyed")
    end
  end

  private

    def set_post
      @post = Post.find_by(uid: params[:uid])
    end

    def post_params
      params.require(:post).permit(:title, :content, :published_at, :status)
    end
end
