class Item < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :charge_id, presence: true
  validates :region_id, presence: true
  validates :period_id, presence: true
  validates :price, presence: true
end
