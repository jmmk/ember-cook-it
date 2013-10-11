App.Ingredient = DS.Model.extend
  recipes: DS.hasMany('recipe')
  pantries: DS.hasMany('pantry')

  name: DS.attr()
