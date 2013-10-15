class PantrySerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id

  has_many :ingredients
end
