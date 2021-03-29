class BuyProduct < ApplicationRecord
    has_one :ship
    belongs_to :product
    belongs_to :user
end
