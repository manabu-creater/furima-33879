class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :detail
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :price, format: { with: /\A[0-9]+\z/ }
    validates :delivery_bear_id, numericality: { other_than: 1 }
    validates :delivery_area_id, numericality: { other_than: 1 }
    validates :delivery_day_id, numericality: { other_than: 1 }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_bear
  belongs_to :delivery_area
  belongs_to :delivery_day
end
