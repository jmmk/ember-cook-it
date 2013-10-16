App.Recipe = DS.Model.extend
  recipeIngredients: DS.hasMany('recipeIngredient', async: true)
  title: DS.attr()
  directions: DS.attr()
