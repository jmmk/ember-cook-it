App.RecipesIndexRoute = Ember.Route.extend
  model: ->
    @store.findAll('recipe')

  setupController: (controller, model) ->
    controller.set('content', model)
    pantry = @store.find('pantry', 1)
    controller.set('pantry', pantry)
