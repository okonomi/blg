class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @posts = Post.includes(:tags, :post_tags, :rich_text_content)
                 .joins(:tags).merge(Tag.where(id: @tag.id))
                 .published.latest
  end
end
