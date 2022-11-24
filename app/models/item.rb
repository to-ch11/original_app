class Item < ApplicationRecord
  has_many :item_branch_relations
  has_many :branches, through: :item_branch_relations
  has_many :item_factory_relations
  has_many :factories, through: :item_factory_relations
  has_many :shippings
  has_many :budgets
  enum large_classification: { granular: 1, powdery: 2, liquid: 3, blend: 4 }
  enum small_classification: { high_type: 1, low_type: 2, nk_type: 3, l_type: 4, v_type: 5 }
end
