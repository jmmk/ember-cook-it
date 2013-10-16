App.Pantry = DS.Model.extend
  pantryIngredients: DS.hasMany('pantryIngredient', async: true)
  user: DS.belongsTo('user')
