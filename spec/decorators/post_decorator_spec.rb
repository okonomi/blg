require 'rails_helper'

RSpec.describe PostDecorator do
  describe '#posted_date' do
    let(:post) { Post.new(posted_at: posted_at).extend PostDecorator }

    subject { post.posted_date }

    context 'when posted_at is null' do
      let(:posted_at) { nil }
      it { is_expected.to eq '' }
    end

    context 'when posted_at is "2019-01-01"' do
      let(:posted_at) { '2019-01-01' }
      it { is_expected.to eq '2019-01-01' }
    end
  end
end
