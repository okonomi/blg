class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def show

  end

  private

    def set_post
      @post = Post.find_by(uid: params[:uid])
    end
end
