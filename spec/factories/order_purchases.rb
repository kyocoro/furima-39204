FactoryBot.define do
  factory :order_purchase do
    token {"tok_abcdefghijk00000000000000000"}
    postcode { '123-4567' }
    region_id { 3 }
    municipalities { '中央区' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    telephone { '09012345678' }
  end
end
