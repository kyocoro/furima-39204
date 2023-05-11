FactoryBot.define do
  factory :item do
    name         { 'test' }
    explanation  { 'testexample' }
    category_id  { 2 }
    condition_id { 2 }
    charge_id    { 2 }
    region_id    { 10 }
    period_id    { 2 }
    price        { "1000" }

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end