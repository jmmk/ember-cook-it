App.Ingredient = DS.Model.extend
  recipeIngredients: DS.hasMany('recipeIngredient')
  recipes: DS.hasMany('recipe')

  pantryIngredients: DS.hasMany('pantryIngredient')
  pantries: DS.hasMany('pantry')

  name: DS.attr()
