App.User = DS.Model.extend
  pantry: DS.belongsTo('pantry', async: true)

  email: DS.attr()
  password: DS.attr()
  passwordConfirmation: DS.attr()
