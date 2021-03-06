class DeliveryDay < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '１〜2日で発送' },
    { id: 3, name: '３〜4日で発送' },
    { id: 4, name: '４〜7日で発送' }
  ]

  include ActiveHash::Associations
  has_many :items
end
