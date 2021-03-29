class Product < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :charge
    belongs_to :area
    belongs_to :delivery
    belongs_to :user
    has_one_attached :image
    has_one :buy_product
    

    with_options presence: true do
        validates :image
        validates :name
        validates :describe
        validates :category_id
        validates :condition_id
        validates :charge_id
        validates :delivery_id
        validates :area_id
        validates :price, numericality: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
    end

    with_options numericality: { other_than: 1 } do
        validates :category_id
        validates :condition_id
        validates :charge_id
        validates :delivery_id
        validates :area_id
    end

    
end
