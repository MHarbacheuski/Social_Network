# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    association :user, factory: :user
    association :profile, factory: :profile
    heading { 'gg' }
    content { 'grege' }
  end
end
