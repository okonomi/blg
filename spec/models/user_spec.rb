require "rails_helper"

RSpec.describe User, type: :model do
  describe "remember_token" do
    context "when create user" do
      subject do
        described_class.create!.remember_token
      end

      it { is_expected.not_to be_empty }
    end
  end
end
