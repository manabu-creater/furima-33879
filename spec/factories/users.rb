FactoryBot.define do
  factory :user do
    nickname              {"wada"}
    first_name            {"タロウ"}
    last_name             {"ワダ"}
    first_name_kana       {"カタカナ"}
    last_name_kana        {"カタカナ"}
    birthday              {"2020.1.1"}
    email                 {"g@com"}
    password              {"kkk777"}
    password_confirmation {password}
  end
end