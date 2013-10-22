App.Recipe = DS.Model.extend
  recipeIngredients: DS.hasMany('recipeIngredient')
  user: DS.belongsTo('user')

  title: DS.attr()
  directions: DS.attr()
  topFive: DS.attr()
