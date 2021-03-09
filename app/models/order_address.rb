class OrderAddress
  include ActiveModel::ActiveModel
  attr_accessor :zip_code, :delivery_area_id, :city, :address, :building, :phone, :order_id, :user_id, :item_id
  
  with_options presnece: true do
    validates :zip_code format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :delivery_area_id numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone format: { with: /\A\d{11}\z/ }
    validates :order_id
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip_code: zip_code, delivery_area_id: delivery_area_id, city: city, address: address, building: building, phone: phone, orde_idr: order.id)
  end

end