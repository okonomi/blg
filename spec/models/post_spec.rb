require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'uid' do
    context 'when create post' do
      subject do
        described_class.create!.uid
      end

      it { is_expected.to_not be_empty }
    end
  end
end
