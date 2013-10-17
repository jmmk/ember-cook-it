App.PantryEditRoute = Ember.Route.extend
  model: ->
    @store.find('pantry', 1)

  setupController: (controller, model) ->
    controller.set('content', model)
    controller.set('deletions', [])

  actions:
    willTransition: (transition) ->
      @controllerFor('pantry.edit').clearUnsavedChanges()
