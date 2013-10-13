App.Ingredient = DS.Model.extend
  element: DS.belongsTo('element', polymorphic: true, inverse: 'ingredients')

  name: DS.attr()
