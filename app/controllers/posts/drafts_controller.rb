module Posts
  class DraftsController < ApplicationController
    def index
      @posts = authorize Post.includes(:tags).draft.latest
    end
  end
end
