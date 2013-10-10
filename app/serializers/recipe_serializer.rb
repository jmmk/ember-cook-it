class RecipeSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :title, :directions

  has_many :ingredients
end
