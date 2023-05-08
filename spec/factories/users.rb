FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    last_name             {Gimei.last.kanji}
    first_name            {Gimei.first.kanji}
    last_name_k           {Gimei.last.katakana}
    first_name_k          {Gimei.first.katakana}
    birthday              {Faker::Date.between(from: '1990-01-01', to:'2020-12-08')}
  end
end