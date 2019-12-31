require "rails_helper"

RSpec.describe Blg::PostDecorator do
  describe "#published_date" do
    subject { post.published_date }

    let(:post) { Blg::Post.new(published_at: published_at).extend Blg::PostDecorator }

    context "when published_at is null" do
      let(:published_at) { nil }
      it { is_expected.to eq "" }
    end

    context 'when published_at is "2019-01-01 23:59:59"' do
      let(:published_at) { "2019-01-01 23:59:59" }
      it { is_expected.to eq "2019-01-01 23:59" }
    end
  end
end
