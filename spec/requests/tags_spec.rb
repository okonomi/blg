require "rails_helper"

RSpec.describe "Tags", type: :request do
  describe "GET /tags/:id" do
    subject do
      get tag_path(tag)
      response
    end

    let(:tag) { create(:tag) }

    it { is_expected.to have_http_status(:ok) }
  end
end
