class Post < ApplicationRecord
  scope :latest, -> { order(posted_at: :desc) }
end
