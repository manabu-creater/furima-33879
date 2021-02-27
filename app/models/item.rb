class Item < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name
    validates :detail
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id
    validates :price, format: { with: /\A[0-9]+\z/ }
    validates :delivery_day_id
    validates :delivery_area_id
    validates :delivery_bear_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_bear
  belongs_to :delivery_area
  belongs_to :delivery_day
end
