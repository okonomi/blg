require 'rails_helper'

RSpec.describe PostDecorator do
  describe '#published_date' do
    let(:post) { Post.new(published_at: published_at).extend PostDecorator }

    subject { post.published_date }

    context 'when published_at is null' do
      let(:published_at) { nil }
      it { is_expected.to eq '' }
    end

    context 'when published_at is "2019-01-01 23:59:59"' do
      let(:published_at) { '2019-01-01 23:59:59' }
      it { is_expected.to eq '2019-01-01 23:59' }
    end
  end
end
