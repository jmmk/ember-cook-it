class RecipeSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :title, :directions

  has_many :ingredients
end
