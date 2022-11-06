class Branch < ApplicationRecord
  has_many :item_branch_relations
  has_many :items, through: :item_branch_relations
  belongs_to :user
end
