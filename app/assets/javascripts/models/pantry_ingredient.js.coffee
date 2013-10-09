App.PantryIngredient = DS.Model.extend
  ingredient: DS.belongsTo('ingredient')
  pantry: DS.belongsTo('pantry')
