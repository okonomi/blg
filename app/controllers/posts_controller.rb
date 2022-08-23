class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
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

  private

    def set_post
      @post = Post.find_by(uid: params[:uid])
    end

    def post_params
      params.require(:post).permit(:title, :content, :published_at, :status)
    end
end
