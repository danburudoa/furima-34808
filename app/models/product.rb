class Product < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :charge
    belongs_to :area
    belongs_to :delivery
    belongs_to :user
    has_one_attached :image


    with_options presence: true do
        validates :image
        validates :name
        validates :describe
        validates :category_id, numericality: { other_than: 1 }
        validates :condition_id, numericality: { other_than: 1 }
        validates :charge_id, numericality: { other_than: 1 }
        validates :delivery_id, numericality: { other_than: 1 }
        validates :area_id, numericality: { other_than: 1 }
        validates :price, numericality: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
    end

    
end
