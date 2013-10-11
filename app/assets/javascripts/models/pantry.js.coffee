App.Pantry = DS.Model.extend
  user: DS.belongsTo('user')

  pantryIngredients: DS.hasMany('pantryIngredient')
  ingredients: DS.hasMany('ingredient', async: true)
