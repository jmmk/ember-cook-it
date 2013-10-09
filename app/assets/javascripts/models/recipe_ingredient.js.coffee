App.RecipeIngredient = DS.Model.extend
  ingredient: DS.belongsTo('ingredient')
  recipe: DS.belongsTo('recipe')
