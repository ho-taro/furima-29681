class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to :user
  has_one :settlement
  has_one_attached :image

  with_options presence: true do
    validates :products_name
    validates :description
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :shipping_place_id, numericality: { other_than: 0 }
    validates :day_to_ship_id, numericality: { other_than: 1 }
    validates :price
    validates :user
    validates :genre
  end
end
