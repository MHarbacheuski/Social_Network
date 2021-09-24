FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    #encrypted_password { "$2a$10$5eoHh6M2q4GjGkHClO.NqebWWhS94D8rNj5Ot6CB2qrbn7IrTfkSa" }
    #reset_password_token { nil }
    #reset_password_sent_at{ nil }
  end
end