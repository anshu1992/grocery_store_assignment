FactoryBot.define do
  factory :product do
    association :category

    title { 'Broccoli' }
    description { 'It is a Broccoli' }
    price { 5.0 }
  end
end
