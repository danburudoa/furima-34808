FactoryBot.define do
  factory :buy_product_ship do
    postal_code    { '123-4567' }
    area_id        { 2 }
    municipalities {'東京都'}
    address        { '1-1' }
    building       { 'プラザ'}
    phone_number   { "08082217112"}
    token          { "tok_384585485"}
  end
end
