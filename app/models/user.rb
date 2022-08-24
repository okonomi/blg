class User < ApplicationRecord
  before_create :set_remember_token

  private

    def set_remember_token
      self.remember_token = generate_remember_token
    end

    def generate_remember_token
      SecureRandom.hex(20)
    end
end
