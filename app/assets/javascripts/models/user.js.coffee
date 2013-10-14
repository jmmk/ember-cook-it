App.User = DS.Model.extend
  pantry: DS.belongsTo('pantry')

  email: DS.attr()
  password: DS.attr()
  passwordConfirmation: DS.attr()
