App.Pantry = DS.Model.extend
  user: DS.belongsTo('user')
  pantryIngredients: DS.hasMany('pantryIngredient', async: true)
