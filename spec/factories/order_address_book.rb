FactoryBot.define do
  factory :order_address_book do
    postcode { '111-2222' }
    prefecture_id { '1' }
    city { 'さいたま市緑区' }
    block { 'さいたま1-1-1' }
    building { 'さいたまビル123' }
    mobile { '11122223333' }
    user_id { '30' }
    item_id { '31' }
    order_id { '22' }
    token { 'bvsfdbsdfbsebse'}
  end
end
