FactoryBot.define do
  factory :order do
    cardnumber {4242424242424242}
    expiration {"12/25"}
    securitycode{123}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
