FactoryBot.define do
  factory :order_address do
    zip_code { '123-4567' }
    delivery_area_id {'2'}
    city {'横浜市'}
    address {'1-1'}
    building {'横浜ビル'}
    phone {'08012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
