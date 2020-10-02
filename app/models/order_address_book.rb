class OrderAddressBook
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :mobile, :order_id, :token

  POST_CODE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  MOBILE_CODE_REGEX = /\A\d{11}\z/.freeze

  with_options presence: true do
    validates :postcode, format: { with: POST_CODE_REGEX, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :city
    validates :block
    validates :mobile, format: { with: MOBILE_CODE_REGEX }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    AddressBook.create!(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, mobile: mobile, order_id: order.id)
  end
end
