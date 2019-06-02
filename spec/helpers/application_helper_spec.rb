require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "#page_title" do
    subject do
      ENV["BLOG_TITLE"] = blog_title
      page_title(title)
    end

    let(:blog_title) { "blog" }

    context "when present title" do
      let(:title) { "awesome post" }
      it { is_expected.to eq "awesome post | blog" }
    end

    context "when blank title" do
      let(:title) { "" }
      it { is_expected.to eq "blog" }
    end
  end
end
