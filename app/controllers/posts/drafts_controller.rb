module Posts
  class DraftsController < ApplicationController
    def index
      @posts = authorize Post.includes(:tags, :rich_text_content).draft.latest
    end
  end
end
