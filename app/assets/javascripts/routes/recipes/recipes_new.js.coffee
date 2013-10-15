App.RecipesNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('recipe')

  actions:
    willTransition: (transition) ->
      @controllerFor('recipes.new').clearUnsavedChanges()
