class PantrySerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id

  has_many :pantry_ingredients
end
