App.PantryIngredient = DS.Model.extend
  pantry: DS.belongsTo('pantry')

  name: DS.attr()
