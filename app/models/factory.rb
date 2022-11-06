class Factory < ApplicationRecord
  has_many :item_factory_relations
  has_many :items, through: :item_factory_relations
end
