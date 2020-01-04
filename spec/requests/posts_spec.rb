require "rails_helper"

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    subject do
      get posts_path
      response
    end

    it { is_expected.to have_http_status(:ok) }
  end

  describe "GET /posts/new" do
    context "when unautholized" do
      subject { -> { get new_post_path } }

      it { is_expected.to raise_error(Pundit::NotAuthorizedError) }
    end

    context "when autholized" do
      before do
        mock_policy = spy(Blg::PostPolicy)

        allow(Blg::PostPolicy).to receive(:new).and_return(mock_policy)
        allow(mock_policy).to receive(:new?).and_return(true)
      end

      subject do
        get new_post_path
        response
      end

      it { is_expected.to have_http_status(:ok) }
    end
  end

  describe "POST /posts" do
    context "when unauthorized" do
      subject { -> { post posts_path } }

      it { is_expected.to raise_error(Pundit::NotAuthorizedError) }
    end

    context "when authorized" do
      before do
        mock_policy = spy(Blg::PostPolicy)

        allow(Blg::PostPolicy).to receive(:new).and_return(mock_policy)
        allow(mock_policy).to receive(:create?).and_return(true)
      end

      subject do
        post posts_path params
        response
      end

      let(:params) do
        {
          post: {
            title: "title",
            content: "content",
            published_at: Time.zone.now.to_s,
          },
        }
      end

      it { is_expected.to have_http_status(:found) }
    end
  end

  describe "GET /posts/:id" do
    context "when post exists" do
      subject do
        get post_path(post)
        response
      end

      let(:post) { create(:post) }

      it { is_expected.to have_http_status(:ok) }
    end
  end
end
