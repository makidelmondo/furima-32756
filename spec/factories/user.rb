FactoryBot.define do
  factory :user do
    nickname              {"Bob"}
    email                 {"judgementday@skynet.com"}
    password              {"terminatort800"}
    password_confirmation {password}
    surname               {"コナ"}
    name                  {"サラ"}
    kana_surname          {"コナ"}
    kana_name             {"サラ"}
    birthday              {"19641010"}
  end
end