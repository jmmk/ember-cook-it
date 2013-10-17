App.PantryIngredient = DS.Model.extend
  pantry: DS.belongsTo('pantry')
  ingredient: DS.belongsTo('ingredient')

  ingredientName: DS.attr()
