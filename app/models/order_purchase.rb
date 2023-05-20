class OrderPurchase
  include ActiveModel::Model
  attr_accessor :item_id, :postcode, :region_id, :municipalities, :address, :building_name, :telephone, :user_id, :token
  
  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :region_id
    validates :municipalities
    validates :address
    validates :telephone, format: { with: /\A\d{10,11}\z/ }
  end

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :region_id, numericality: { other_than: 1 , message: "can't be blank"}
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Purchase.create(postcode: postcode, region_id: region_id, municipalities: municipalities, address: address, building_name: building_name, telephone: telephone, order_id: order.id)
  end
  
end
