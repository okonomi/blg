FactoryBot.define do
  factory :post, class: "Post" do
    title { "test title" }
    content { "test content" }
    published_at { Time.zone.now }
  end
end
