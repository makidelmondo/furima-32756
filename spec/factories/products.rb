FactoryBot.define do
  factory :product do
    title             {"T-800"}
    explanation       {"Mass production terminatorT800. I'd terminated it once but I've fixed it."}
    category_id       { 2 }
    product_status_id { 2 }
    shipping_fee_id   { 2 }
    state_id          { 2 }
    shipping_date_id  { 2 }
    price             { 300 }
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
