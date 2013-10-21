App.User = DS.Model.extend
  pantry: DS.belongsTo('pantry', async: true)
  recipes: DS.hasMany('recipe')

  email: DS.attr()
  password: DS.attr()
  passwordConfirmation: DS.attr()
