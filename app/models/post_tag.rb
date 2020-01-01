class PostTag < ApplicationRecord
  belongs_to :post, class_name: "Blg::Post"
  belongs_to :tag, class_name: "Blg::Tag"
end
