class Item < ApplicationRecord

  belongs_to :user
  has_one :settlement
  has_one_attached :image

  with_options presence: true do
    validates :nickname
    validates :description
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :shipping_place_id
    validates :day_to_ship_id
    validates :price
    validates :user
  end
end
