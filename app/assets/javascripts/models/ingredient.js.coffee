App.Ingredient = DS.Model.extend
  pantries: DS.hasMany('pantry', inverse: 'ingredients')
  recipes: DS.hasMany('recipe', inverse: 'ingredients')

  name: DS.attr()
