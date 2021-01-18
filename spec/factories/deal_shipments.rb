FactoryBot.define do
  factory :deal_shipment do
    zip_code   {"194-0041"}
    state_id   {14}
    city       {"町田市"}
    street     {"玉川学園1-5-19"}
    apartment  {}
    telephone  {"08019190721"}
    association :user
    association :product
  end
end
