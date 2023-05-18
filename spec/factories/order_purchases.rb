FactoryBot.define do
  factory :order_purchase do
    cardnumber { '1234123412341234' }
    expiration_month { '12' }
    expiration_year { '30'}
    securitycode { '111' }
    postcode { '123-4567' }
    region_id { 3 }
    municipalities { '中央区' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    telephone { '09012345678' }
  end
end
