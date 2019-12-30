class TagsController < ApplicationController
  def show
    @tag = Tag.includes(posts: %i[tags rich_text_content]).find(params[:id])
  end
end
