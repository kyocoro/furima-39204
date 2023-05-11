class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :region
  belongs_to :period

  #空の投稿を保存できないようにする
  validates :name, :explanation, presence: true

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, :condition_id, :charge_id, :region_id, :period_id, numericality: { other_than: 1 , message: "can't be blank"}

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