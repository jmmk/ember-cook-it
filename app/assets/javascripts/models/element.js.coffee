App.Element = DS.Model.extend
  ingredients: DS.hasMany('ingredient', async: true, inverse: 'element')
