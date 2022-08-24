require "rails_helper"

RSpec.describe "Posts/Drafts", type: :request do
  describe "GET /posts/drafts" do
    subject do
      get posts_drafts_path
      response
    end

    it { is_expected.to have_http_status(:ok) }
  end
end
