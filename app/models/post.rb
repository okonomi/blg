class Post < ApplicationRecord
  has_many :post_tags
  has_many :tags, through: :post_tags

  before_create :set_uid

  scope :latest, -> { order(published_at: :desc) }

  has_rich_text :content

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
