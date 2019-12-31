module Posts
  class DraftsController < ApplicationController
    def index
      @posts = authorize Blg::Post.includes(:tags, :rich_text_content).draft.latest
    end
  end
end
