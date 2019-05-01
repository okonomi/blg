class Post < ApplicationRecord
  scope :latest, -> { order(posted_at: :desc) }

  has_rich_text :content
end
