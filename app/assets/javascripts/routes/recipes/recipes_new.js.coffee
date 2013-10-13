App.RecipesNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('recipe')

  action:
    willTransition: (transition) ->
      @controllerFor('recipes.new').clearUnsavedChanges()
