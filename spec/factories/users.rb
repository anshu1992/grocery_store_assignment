FactoryBot.define do
  factory :user do
    sequence(:email) { |num| "user-#{num}@test.com" }
    password { 'password' }

    trait :with_name do
      first_name { "John" }
      last_name { "Doe" }
      phone_number { "1234567890" }
      email { "funny@mail.com" }
    end
  end
end
