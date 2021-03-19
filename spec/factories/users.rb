FactoryBot.define do
    factory :user do
        nickname                {Faker::Name.initials(number: 2)}
        email                   {Faker::Internet.free_email}
        password                {"abc123" + Faker::Internet.password(min_length: 6)}
        password_confirmation   {password}
        lastname_kanji          {"山田"}
        firstname_kanji         {"ヤマダ"}
        lastname_katakana       {"太郎"}
        firstname_katakana      {"タロウ"}
        birthday                {Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}
    end 
  end