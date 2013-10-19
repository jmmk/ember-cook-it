App.RecipesIndexRoute = Ember.Route.extend
  model: ->
    @store.findAll('recipe')

  setupController: (controller, model) ->
    controller.set('content', model)
    @store.find('pantry', 'current').then (pantry) ->
      controller.set('pantry', pantry)
