App.Recipe = DS.Model.extend
  ingredients: DS.hasMany('ingredient')

  title: DS.attr()
  directions: DS.attr()
