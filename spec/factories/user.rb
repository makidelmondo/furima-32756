FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    surname               {"コナ"}
    name                  {"サラ"}
    kana_surname          {"コナ"}
    kana_name             {"サラ"}
    birthday              {"1964-10-10"}
  end
end