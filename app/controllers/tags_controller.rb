class TagsController < ApplicationController
  def show
    @tag = Blg::Tag.find(params[:id])
    @posts = Blg::Post.includes(:tags, :post_tags, :rich_text_content)
                      .joins(:tags).merge(Blg::Tag.where(id: @tag.id))
                      .published.latest
  end
end
