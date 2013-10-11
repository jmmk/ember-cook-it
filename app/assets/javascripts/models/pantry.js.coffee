App.Pantry = DS.Model.extend
  user: DS.belongsTo('user')

  ingredients: DS.hasMany('ingredient', async: true)
