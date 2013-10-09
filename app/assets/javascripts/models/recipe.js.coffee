App.Recipe = DS.Model.extend
  recipeIngredients: DS.hasMany('recipeIngredient')
  ingredients: DS.hasMany('ingredient')

  title: DS.attr()
  directions: DS.attr()
