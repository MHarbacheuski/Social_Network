FactoryBot.define do
  factory :comment do
    association :user, factory: :user
    association :post, factory: :post
    text_comment { Faker::Subscription.plan }
    picture { nil }
  end
end