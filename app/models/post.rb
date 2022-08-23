class Post < ApplicationRecord
  before_create :set_uid

  scope :latest, -> { order(published_at: :desc) }

  has_rich_text :content

  enum status: {
    draft: 0,
    published: 1,
  }

  def to_param
    uid
  end

  private

    def set_uid
      self.uid = generate_uid
    end

    def generate_uid
      SecureRandom.hex(20)
    end
end
