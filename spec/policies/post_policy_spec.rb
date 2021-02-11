require "rails_helper"

RSpec.describe PostPolicy, type: :policy do
  subject { described_class }

  let(:post) { build(:post) }

  permissions :new? do
    context "logged in user" do
      let(:user) { User.new }
      it { is_expected.to permit(user, post) }
    end

    context "anonymous user" do
      let(:user) { nil }
      it { is_expected.not_to permit(user, post) }
    end
  end

  permissions :edit? do
    context "logged in user" do
      let(:user) { User.new }
      it { is_expected.to permit(user, post) }
    end

    context "anonymous user" do
      let(:user) { nil }
      it { is_expected.not_to permit(user, post) }
    end
  end

  permissions :destroy? do
    context "logged in user" do
      let(:user) { User.new }
      it { is_expected.to permit(user, post) }
    end

    context "anonymous user" do
      let(:user) { nil }
      it { is_expected.not_to permit(user, post) }
    end
  end
end
