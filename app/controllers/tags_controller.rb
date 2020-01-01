class TagsController < ApplicationController
  def show
    @tag = Blg::Tag.includes(posts: %i[tags rich_text_content]).find(params[:id])
  end
end
