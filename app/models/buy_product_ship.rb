class BuyProductShip
  include ActiveModel::Model
    attr_accessor :postal_code,:area_id,:municipalities,:address,:building,:phone_number,:user_id, :product_id,:token 

    # ここにバリデーションの処理を書く
     with_options presence: true do
        validates :postal_code , format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
        validates :municipalities
        validates :address
        validates :phone_number, format: { with: /\A\d{11}\z/, message: 'Input only number' }
        validates :token
        validates :user_id
        validates :product_id
     end
        validates :area_id, numericality: { other_than: 1, message: 'Select' }
      
      def save
        buy_product =  BuyProduct.create!(user_id: user_id, product_id: product_id)
        Ship.create!(postal_code: postal_code, municipalities: municipalities, area_id: area_id, address: address, phone_number: phone_number, buy_product_id: buy_product.id)
      end
  
  end