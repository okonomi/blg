class TagsController < ApplicationController
  def show
    @tag = Tag.includes(:posts).find(params[:id])
  end
end
