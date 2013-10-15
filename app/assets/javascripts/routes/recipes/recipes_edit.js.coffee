App.RecipesEditRoute = Ember.Route.extend
  model: (params) ->
    @store.find('recipe', params.recipe_id)

  setupController: (controller, model) ->
    controller.set('content', model)
    controller.set('deletions', [])

  actions:
    willTransition: (transition) ->
      @controllerFor('recipes.edit').clearUnsavedChanges()
