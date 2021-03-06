FactoryBot.define do
  factory :item do
    name                  { 'シューズ' }
    detail                { '履きやすい' }
    price                 { 5000 }
    category_id           { 2 }
    condition_id          { 2 }
    delivery_area_id      { 2 }
    delivery_bear_id      { 2 }
    delivery_day_id       { 2 }
    association :user
  end
end
