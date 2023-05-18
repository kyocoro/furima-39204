class OrderPurchase
  include ActiveModel::Model
  attr_accessor :cardnumber, :expiration, :securitycode, :postcode, :region_id, :municipalities, :address, :building_name, :telephone, :user_id
  attr_accessor :token
  
  with_options presence: true do
    validates :postcode, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end

  def save
    order = Order.create(cardnumber: cardnumber, expiration: expiration, securitycode: securitycode)
    Purchase.create(postcode: postcode, region_id: region_id, municipalities: municipalities, address: address, building_name: building_name, telephone: telephone, user_id: user_id)
  end
  
end
