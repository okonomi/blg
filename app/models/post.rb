class Post < ApplicationRecord
  scope :latest, -> { order(published_at: :desc) }

  has_rich_text :content
end
