class Order < ApplicationRecord
  #attr_accessor :token
  #validates :token, presence: true

  has_one :purchase
  belongs_to :item
  belongs_to :user
end



