class Budget < ApplicationRecord
  belongs_to :item
  belongs_to :shipping
  has_many :budgets_details
end
