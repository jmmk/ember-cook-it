App.RecipeIngredient = DS.Model.extend
  recipe: DS.belongsTo('recipe')

  name: DS.attr()
