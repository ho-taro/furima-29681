class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to :user
  has_one :settlement
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :products_name #length: { maximum: 40 }
    validates :description #length: #{ maximum: 1000 }
    validates :category_id, numericality: { other_than: 1, message: 'Select' }
    validates :status_id, numericality: { other_than: 1, message: 'Select' }
    validates :delivery_fee_id, numericality: { other_than: 1, message: 'Select' }
    validates :shipping_place_id, numericality: { other_than: 0, message: 'Select' }
    validates :day_to_ship_id, numericality: { other_than: 1, message: 'Select' }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message:'Out of setting range' }
    validates :user
  end
end
