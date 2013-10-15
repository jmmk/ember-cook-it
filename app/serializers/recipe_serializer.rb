class RecipeSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :title, :directions#, :ingredient_name

  has_many :ingredients

  # def ingredient_name
  #   object.ingredient.name
  # end
end
