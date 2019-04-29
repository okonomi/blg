require 'rails_helper'

RSpec.describe PostPolicy, type: :policy do
  let(:post) { Post.new }

  subject { described_class }

  permissions :new? do
    context 'logged in user' do
      let(:user) { User.new }
      it { is_expected.to permit(user, post) }
    end
    context 'anonymous user' do
      let(:user) { nil }
      it { is_expected.to_not permit(user, post) }
    end
  end

  permissions :edit? do
    context 'logged in user' do
      let(:user) { User.new }
      it { is_expected.to permit(user, post) }
    end
    context 'anonymous user' do
      let(:user) { nil }
      it { is_expected.to_not permit(user, post) }
    end
  end

  permissions :destroy? do
    context 'logged in user' do
      let(:user) { User.new }
      it { is_expected.to permit(user, post) }
    end
    context 'anonymous user' do
      let(:user) { nil }
      it { is_expected.to_not permit(user, post) }
    end
  end
end
