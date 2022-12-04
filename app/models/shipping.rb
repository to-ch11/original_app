class Shipping < ApplicationRecord
  belongs_to :user
  belongs_to :item
  # belongs_to :budget
  has_many :shipping_details

end
