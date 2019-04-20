require 'rails_helper'

RSpec.describe PostPolicy, type: :policy do
  let(:user) { User.new }
  let(:post) { Post.new }

  subject { described_class }

  permissions :new? do
    it 'anyone can create new post' do
      expect(subject).to permit(user, post)
    end
  end
end
