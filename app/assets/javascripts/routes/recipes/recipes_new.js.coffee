App.RecipesNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('recipe')

  deactivate: ->
    @controllerFor('recipes.new').stopEditing()
