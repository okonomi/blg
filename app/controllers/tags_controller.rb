class TagsController < ApplicationController
  def show
    @tag = Tag.includes(posts: [:tags, :rich_text_content]).find(params[:id])
  end
end
