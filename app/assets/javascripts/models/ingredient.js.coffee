App.Ingredient = DS.Model.extend
  recipeIngredients: DS.hasMany('recipeIngredient')
  pantryIngredient: DS.hasMany('pantryIngredient')

  name: DS.attr()
