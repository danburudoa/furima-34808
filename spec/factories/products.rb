FactoryBot.define do
  factory :product do
    name                {Faker::Games::Zelda.item}
    describe            {Faker::Games::Zelda.game}
    category_id         {2}
    condition_id        {2}
    charge_id           {2}
    delivery_id         {2}
    area_id             {2}
    price               {Faker::Number.number(digits: 4)}

    association :user
  end
end
